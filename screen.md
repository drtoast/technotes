# NOTE

change escape key from ctrl-a to backtick(`) in .screenrc

    escape `\'

# Session/window management

start a new screen session

     screen

create a new window

     ` c

rename a window

     ` A

kill a window

     exit

go to next/previous/specific window

     ` n
     ` p
     ` 2

list windows

     ` w

detach/reattach a window

     ` d
     ` r

reattach session

     screen -R (reattach first found session)
     screen -d -r (detach from other session then reattach here)

show running screens

     screen -list

# Scrollback

define max scrollback lines in `$HOME/.screenrc`:

    def scrollback 5000

enter copy/scrollback mode:

    ` [

# copy/scrollback mode navigation commands

    h -    Move the cursor left by one character
    j -    Move the cursor down by one line
    k -    Move the cursor up by one line
    l -    Move the cursor right by one character
    0 -    Move to the beginning of the current line
    $ -    Move to the end of the current line.
    G -    Moves to the specified line 
           (defaults to the end of the buffer).
    C-u -  Scrolls a half page up.
    C-b -  Scrolls a full page up.
    C-d -  Scrolls a half page down.
    C-f -  Scrolls the full page down.

# my .screenrc

    shell -/bin/bash
    shelltitle ''
    autodetach on
    startup_message off
    defscrollback 2048
    escape `\'
    hardstatus alwayslastline "%-Lw%{= BW}%50>%n%f* %t%{-}%+Lw%< %=%D %M %d %c"
    hardstatus string '%{= kK}%-Lw%{= KW}%50>%n%f %t%{= kK}%+Lw%< %{=kG}%-= %d%M %c:%s%{-}'
