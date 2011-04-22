#!/bin/sh

echo "VARIABLES: script"
echo $0;        # this command name
echo $$;        # this pid
echo $1;        # specific arg

echo "VARIABLES: environment"
echo $USER;     # user name
echo $HOME;     # user's home dir
echo $PATH;     # user's path
echo $PWD;      # working directory

echo "VARIABLES: get/set"
something='blah'    # no spaces!
echo $something

echo "ARITHMETIC:"
val= expr 1 + 3     # space!
echo $val

echo "QUOTES:"
echo "Today is `date`"      # backticks capture command output
echo "First arg was $1"     # double quotes interpolate vars
echo 'First arg costs $1'   # single quotes don't

echo "EXIT STATUS:"
val= expr 1 / 1
echo $?             # 0 == success
val= expr 1 / 0
echo $?             # 2 == failure

echo "CONTROL: if/else/fi"
if [ 5 -gt 0 ]      # or "test 5 -gt 0"
then
    echo "number is positive"
fi

echo "TEST: numeric"
test 5 -eq 6        # equals
test 5 -ne 6        # not equals
test 5 -lt 6        # less than
test 5 -le 6        # less than or equal to
test 5 -gt 6        # greater than
test 5 -ge 6        # greater than or equal to

echo "TEST: strings"
string1=a
string2=b
test string1 = string2
test string1 != string2
test -n string1     # exists and is not null
test -z string1     # is null and exists

echo "TEST: files"
test -s "blah.txt"  # non-empty file
test -f "blah.txt"  # file exists, not directory
test -d "dir"       # is directory
test -w "blah.txt"  # is writeable file
test -r "blah.txt"  # is read-only file
test -x "blah.txt"  # is executable file

echo "TEST: logical"
test ! string1 = string2        # not
test expression1 -a expression2 # and
test expression1 -o expression2 # or

echo "TEST: boolean"
var=1
if [ $var -eq 1 ]
then
    echo "true"
else
    echo "false"
fi

echo "CONTROL: for"
for i in 1 2 3 4 5
do
    echo "Welcome $i times"
done

for ((  i = 1 ;  i <= 5;  i++  ))
do
  echo "Welcome $i times"
done

echo "CONTROL: while"
n=$1
i=1
while [ $i -le 10 ]
do
    echo $i
    i=`expr $i + 1` # wow, really?
done