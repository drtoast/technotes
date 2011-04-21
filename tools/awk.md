# Usage

    awk '/pattern/' location.txt
    awk -F"separator" 'pattern {function}' file.txt

# Extracting data

print all lines matching "gold"

    awk '/gold/' input.txt > output.txt

print first two columns of tab-delimited file where beginning of line matches "VP"

    awk -F't' '/^VP/ {print $1 "\t" $2}'  input.txt > output.txt

print first two columns if sixth column is "Y"

    awk -F't' '$6~/^Y$/ {print $1 "\t" $2}'  input.txt > output.txt

print first two columns if sixth column is "Y" and first column starts with "VP"

    awk -F't' '(($6~/^Y$/) && ($1~/^VP/)) {print $1 "\t" $2}'  input.txt > output.txt
    
print fields of a Mac file with a non-zero value in the 19th column

    tr 'r' 'n' <macfile.txt | awk -F't' '$19~/[1-9]/ {print $1 "\t" $19}' > result.txt
    
# Statistics

print report showing count of all unique entries in column 2

    awk -F't' '/./ {print $2}' input.txt | sort | uniq -c

count number of unique entries in column 2 (result is a single number)

    awk -F't' '/./ {print $2}' input.txt | sort | uniq | wc -l

count each unique value in a field of a group of files and sort in ascending order

    cat *.txt | awk -F't' '/./ {print $35}' | sort | uniq -c
