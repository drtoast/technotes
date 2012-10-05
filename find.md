# Find by name

find all files on system whose names start with "ipfw" (using normal shell pattern matching syntax)

    find / -name ipfw*

find and delete all files starting in current directory ending in .nov

    find . -name *.nov -exec rm {} ;

find directories in current dir whose names start with "[" (using grep pattern)

    find . -type d -regex '.*/[.*'

same as above, but strip pathname from results, print results

    find . -type d -regex '.*/[.*' | sed "s/.*[/[/p" | sort | uniq > ~/desktop/netlabels.txt

find and delete all filenames starting with a number greater than 568

    600-999:
    find . -regex '.*/[6-9][0-9][0-9]\..*' -exec rm {} \;

    1000-9999:
    find . -regex '.*/[1-9][0-9][0-9][0-9]\..*' -exec rm {} \;

    10000-99999
    find . -regex '.*/[1-9][0-9][0-9][0-9][0-9]\..*' -exec rm {} \;

# Find by time

find all files modified in last 24 hours, last 7 days, or NOT modified in last year

    find . -mtime 0
    find . -mtime -7
    find . -mtime +365

find all files on local drive modified after a given file

    touch /tmp/timestamp 
    sudo find -x / -newer /tmp/timestamp -depth -print > /tmp/newfiles.txt
