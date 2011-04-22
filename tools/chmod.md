# Usage

    chmod [-R] [ugoa] [=+-] [rwxugos] [filename]

where

    -R = recursively

    u = user
    g = group
    o = others
    a = all

    = = assigned
    + = added
    - = subtracted

    r = read
    w = write
    x = execute
    
    u = set same as user
    g = set same as group
    o = set same as others


# Examples

make current dir and all subdirs readable/writable/executable by everyone

    sudo chmod -R a+rwx .

# Numeric

    rwx = 111 = 7
    rw- = 110 = 6
    r-x = 101 = 5
    r-- = 100 = 4
    -wx = 011 = 3
    -w- = 010 = 2
    --x = 001 = 1
    --- = 000 = 0

To get these permissions:

    -rwxr-xr-- info.sh

Run this:

    chmod 754 file.sh
