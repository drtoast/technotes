# Examples

split files into 5MB chunks (named xaa, xab, xac, etc)

    split -b5m inputfilename

rejoin split files

    cat x* > filename

# Transfer a large file over an unreliable connection

on remote:

    gzip filename
    split -b5m filename.gz

on local:

    sftp user@remote.com
    mget x*
    cat x* > filename.gz

resume transfer after failing during file xag

    mget x[a-z][g-z]
