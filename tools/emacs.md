# Use the option key as meta key:

Terminal->Window Settings->Emulation->Use option key as meta key

Each keyboard shortcut stands for a long name, like "kill-word".
To run a command by name, type opt-x, then command, then return.

## OPENING/SAVING:

* Open file:      `ctrl-x ctrl-f`
* Save file:      `ctrl-x ctrl-s`
* Save and exit:  `ctrl-x ctrl-c`

## SCROLLING:

* Scroll up:      `ctrl-v`
* Scroll down:    `opt-v`

## UNDO/REDO:

* Undo:           `ctrl-_`


## MOVEMENT:

by word:

* Forward to end of a word (opt-f)
* Backward to beginning of a word (opt-b)

by line:

* Beginning of a line (ctrl-a)
* End of a line (ctrl-e)

by page:

* Beginning of a page (ctrl-x [)
* End of a page (ctrl-x ])

by file:

* Beginning of buffer/file (opt-<)
* End of buffer/file (opt->)

by paretheses:

    Beginning of parentheses (backward-sexp):
        ctrl-opt-b
    End of parentheses  (forward-sexp):
        ctrl-opt-f
    Up a level of parentheses (backward-up-list):
        ctrl-opt-u
    Down a level of parentheses (down-list):
        ctrl-opt-d

## FUNCTIONS:

    Beginning of a function (beginning-of-defun):
        ctrl-opt-a
    End of a function definition (end-of-defun):
        ctrl-opt-e

## DELETING:

    Delete forward to the end of a word (kill-word):
        opt-d
    Delete backward to the beginning of a word (backward-kill-word):
        opt-DEL
    Delete forward to the end of a line (kill-line):
        ctrl-k
    Delete backward to the beginning of a line (kill-line):
        ctrl-u 0 ctrl-k
    
## SEARCHING:

    Incremental search forward (search as you type until press 'return'):
        ctrl-s
    Incremental search backward (search as you type until press 'return'):
        ctrl-r
    Word search (search for words separated by arbitrary whitespace/newlines):
        ctrl-s RETURN word word word RETURN
    Find/replace text (query-replace)
        opt-%
        (enter search word, return, enter replace word, return.  Each match is selected,
        press "spc" to replace, "del" to skip, "return" to exit replace mode,
        "!" to replace this and all occurrences without further prompting)
    
## SELECTING A REGION:

    The region is the area between the "point" and the "mark".  The "point" is the
    cursor, the "mark" is a saved marker that is set at the current cursor position.
    
    Set the mark (set-mark-command):
        ctrl-space
    Exchange point and mark (makes it easy to see beginning and end of a region):
        ctrl-x ctrl-x
        
## MANIPULATING A REGION:

    Kill it
        ctrl-w
    Copy it (save to a register)
        ctrl-x r s
    Indent it
        ctrl-x 
    
## REGISTERS: (clipboards)

    Each register (clipboard) has a name which is a single character.
    Copy a region into a register (copy-to-register):
        ctrl-x r s a
        (where "r" means register, "s" means save, "a" is name of a reg)
    Cut a region into a register:
        ctrl-x 1 r s a
        (where 1 is numeric arg, "r" means register, "s" means save, "a" is name of a reg)
    Insert text from a register (insert-register):
        ctrl-x r i a
        (where "r" means register, "i" means insert, "a" is name of a reg)
    Display the contents of a register named "R":
        opt-x view-register R
    
## SPLIT WINDOW:

    Split a window into two, stacked vertically
        ctrl-x 2
    Split a window into three, positioned horizontally
        ctrl-x 3
    Select another window (other-window):
        ctrl-x o
    Scroll the next window (scroll-other-window):
        ctrl-opt-v
    Compare two windows
        opt-x compare-windows
    Close/delete selected window (delete-window):
        ctrl-x 0
    Close/delete all windows except selected (delete-other-windows):
        ctrl-x 1