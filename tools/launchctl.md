# List of commands

    launchctl help

# Show loaded jobs

    launchctl list
    
# Start/stop a loaded job

    launchctl stop org.mongodb.mongod
    
# Load a config file

    launchctl load -w ~/Library/LaunchAgents/org.mongodb.mongod.plist
    
# Remove a job

    launchctl remove org.mongodb.mongod