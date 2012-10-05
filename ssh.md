# Create public/private keys:

    ssh-keygen -t dsa

# Add public key to remote host’s authorized keys:

    scp ~/.ssh/id_dsa.pub you@remotehost:id_dsa.pub
    ssh you@remotehost
    cat id_dsa.pub >> .ssh/authorized_keys2
    
# Add a second ssh daemon:

    1) copy /System/Library/LaunchDaemons/ssh.plist to ssh2.plist
    2) make this edit in ssh2.plist: Label com.openssh.sshd2
    3) make this edit in ssh2.plist: SockServiceName ssh2
    4) add this to /etc/services: ssh2 5550/udp ssh2 5550/tcp
    5) run this: sudo launchctl load /System/Library/LaunchDaemons/ssh2.plist
    5a) to refresh or stop: sudo launchctl unload /System/Library/LaunchDaemons/ssh2.plist
    
# Tunneling

screen sharing (open vnc://localhost:15900)

    ssh user@host.com -p 5554 -L 15900:localhost:5900

AFP (open afp://localhost:10548)

    ssh user@host.com -p 5554 -L 10548:localhost:548

# Add a Host Alias

emacs .ssh/config

    Host toastpowerbook
    HostName host.com
    User username
    Port 5554
    
    Host toastpowerbook-screen
    HostName host.com
    User username
    Port 5554
    LocalForward 15900 localhost:5900

