# install and create a database cluster

	brew update self
	brew install postgres
	initdb /usr/local/var/postgres -E utf8
	# then follow the given instructions to set up a LaunchAgent

# Upgrade to 9.2.1

    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
    brew upgrade postgres
    brew info postgres

    mv /usr/local/var/postgres /usr/local/var/postgres.old
    cp /usr/local/Cellar/postgresql/9.2.1/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/

    sudo sysctl -w kern.sysv.shmall=65536
    sudo sysctl -w kern.sysv.shmmax=16777216

    initdb /usr/local/var/postgres -E utf8

    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# USER ADMIN

	psql postgres
	create user postgres with superuser
	\q

# DATABASE ADMIN

console:

	psql postgres
    create role postgres with superuser;
    select * from pg_database;
    create database foo;

command-line tools:

    pg_dump -Ft mydb > db.tar
    pg_restore -d newdb db.tar

list tables:

    SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';




# EXPLAIN/ANALYZE

    http://use-the-index-luke.com/sql/explain-plan/postgresql/operations

# WINDOW FUNCTIONS

    http://www.postgresql.org/docs/9.1/static/tutorial-window.html

    SELECT depname, empno, salary, avg(salary) OVER (PARTITION BY depname) FROM empsalary;

      depname  | empno | salary |          avg
    -----------+-------+--------+-----------------------
     develop   |    11 |   5200 | 5020.0000000000000000
     develop   |     7 |   4200 | 5020.0000000000000000
     develop   |     9 |   4500 | 5020.0000000000000000
     develop   |     8 |   6000 | 5020.0000000000000000
     develop   |    10 |   5200 | 5020.0000000000000000
     personnel |     5 |   3500 | 3700.0000000000000000
     personnel |     2 |   3900 | 3700.0000000000000000
     sales     |     3 |   4800 | 4866.6666666666666667
     sales     |     1 |   5000 | 4866.6666666666666667
     sales     |     4 |   4800 | 4866.6666666666666667
    (10 rows)

    SELECT sum(salary) OVER w, avg(salary) OVER w
    FROM empsalary
    WINDOW w AS (PARTITION BY depname ORDER BY salary DESC);

# CONSOLE (psql)

* toggle vertical format (\x)
* quit (\q)
