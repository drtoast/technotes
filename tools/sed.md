# Usage

# Find

find any lines in input.txt that end in "Y", print them to output.txt

    sed -En "/Y$/p" input.txt > output.txt

find any lines in a Mac file containing the given text

    tr 'r' 'n' <macfile.txt | sed -En "/Y$/p" > output.txt

# Replace 

replace all occurrences of "XYZ" in input.txt with "123" and print results to output.txt

    sed "s/XYZ/123/g" input.txt > output.txt

replace all occurences of "123-456" with "456-123"

    sed 's/^([0-9]*)-([0-9]*)/2-1/g'

# Delete 

delete all lines that start with "VP" and print results to output.txt

    sed "/^VP/d" input.txt > output.txt

strip initial line numbers in TextMate

    cmd-opt-r
    sed 's/^[0-9 .]*//g'