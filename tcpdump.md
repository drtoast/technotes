# Monitor all ethernet traffic

    sudo tcpdump -i en0

# Monitor all establishing connections (only show packets with "SYN" flag set)

    sudo tcpdump -i en0 'tcp[13] == 2'
