# install and create a database cluster

	brew update self
	brew install postgres
	initdb /usr/local/var/postgres
	# then follow the given instructions to set up a LaunchAgent

# USER ADMIN

	psql postgres
	create user postgres with superuser
	\q

# DATABASE ADMIN

console:

	psql postgres
    select * from pg_database;
    create database foo;

command-line tools:

    pg_dump -Ft mydb > db.tar
    pg_restore -d newdb db.tar

# EXPLAIN/ANALYZE

    http://use-the-index-luke.com/sql/explain-plan/postgresql/operations

