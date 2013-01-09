# Open a database

    sqlite3 something.db

# Show all tables

    .tables

# Show columns in a table

    .schema tablename

# Direct output to a file

    .output somefile.txt

# Export all columns

    SELECT * FROM message;

# Get help

    .help

# Reclaim unused space

    VACUUM;

# Exit

    .quit

# Repair a damaged db

    sqlite3 development.sqlite3
    sqlite> .output dump.sql
    sqlite> .dump
    sqlite> .quit

    cat dump.sql | sqlite3 new.sqlite3