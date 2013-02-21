# Documentation

    http://pow.cx/

# Add an app

    cd ~/.pow
    ln -s /path/to/myapp

# Restart an app

    cd /path/to/myapp
    touch tmp/restart.txt

# Restart Pow

    touch ~/.pow/restart.txt

# Logs

    tail -f ~/Library/Logs/Pow/access.log
    tail -f /path/to/myapp/logs/development.log

# Launch Agent

    launchctl list | grep pow
    48897 - cx.pow.powd  # (pid/exitstatus/label)

    launchctl stop cx.pow.powd
    launchctl start cx.pow.powd

