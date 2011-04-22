# Redirecting

* send stdout to a file: somecommand > results.txt
* send stderr to a file: somecommand 2> errors.txt
* send stdout and stderr to a file: somecommand > results.txt 2>&1
* append stdout to a file: somecomand >> results.txt
* append stderr to a file: somecommand 2>> errors.txt
* append stdout and stderr to a file: somecommand >> results.txt 2>&1

#  Usage

Create a text file formatted as follows, named "mycrontab.txt"

    #min	hour	mday	month	wday	command	
    25	2,14	*	*	*	sh	path/to/getmybackup.sh
    30	18	*	*	*	perl /users/jamesrey/Desktop/projects/scripts/backup.pl

Tell crontab to schedule it:

    crontab mycrontab.txt

Display currently scheduled crontabs:

    crontab -l

Cancel the scheduled user crontab:

    crontab -r


#  CRONTAB FIELDS 

The first five columns or "fields" of each line specify at exactly what interval the script will run. The fields specify from left to right: 

* minute
* hour (on a 24-hour clock)
* day of the month
* month
* weekday (numerically, with Sunday as 7)
	
Asterisks used instead of numbers in these fields mean "every." 

Note that a user crontab lacks field six (user), which is shown below in system crontab examples.

Also note that commands executed by crond have no associated terminal. ie. standard output & standard error must be redirected.  

Ex: "3:15 a.m. on every day of the month, on every month, and every day of the week" =

    15	3	*	*	*	root	sh /etc/daily 2>&1 | tee /var$ ...

Ex: "4:30 a.m. on every weekday number 6, or Saturday" =

    30	4	*	*	6	root	sh /etc/weekly 2>&1 | tee /var$ ...

Ex: "5:30 a.m. on day 1 (the first) of each month" =

    30	5	1	*	*	root	sh /etc/monthly 2>&1 | tee /var$ ...


# USER CRONTAB examples

Ex: At half past the hour, between 9 and 5, for every day of January which is Sunday, Wednesday or Saturday, append date to file date.file 

    30	9-17	*	1	sun,wed,sat	echo `date` >> /date.file 2>&1 

Ex: Every two hours from 11p.m. to 7a.m., and at 8a.m. 

    0	23-7/2,8	*	*	*	date 

Ex: 4:00 a.m. on january 1st

    0	4	1	jan	*	date