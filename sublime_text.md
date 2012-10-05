http://docs.sublimetext.info/en/latest/index.html


# Selecting

words:

* select word, more instances (cmd-D)
* skip current instance (cmd-K)
* select text within brackets (ctrl-shift-M)

lines:

* select line(s) (cmd-L)
* select lines as multiple selection (cmd-shift-L)
* select current indentation level (cmd-shift-J)


# Editing

lines:

* cut current line (cmd-X)
* delete current line (ctrl-shift-K)
* move lines up/down (ctrl-cmd-arrow)
* join lines (cmd-J)
* insert new line after (cmd-return)
* insert new line before (cmd-shift-return)
* duplicate line (cmd-shift-D)
* paste lines with correct indent (cmd-shift-V)


# Navigation

files/keywords:

* go to anything (cmd-P filename)
* command palette (cmd-shift-P)
* go to symbol (cmd-R foobar, cmd-P @foobar)
* go to fuzzy text (cmd-P #foobar)
* go to line number (cmd-P :123, ctrl-G)

in file:

* search within file (cmd-P#)

sidebar/console:

* show/hide console: (ctrl-`)
* reveal file in sidebar: (alt-.)
* go to sidebar (ctrl-0)
* go back to editor (esc)
* open/close console: (ctrl-`)

# Find/Replace

* replace (cmd-opt-F)

# Packages

* install package (cmd-shift-P, pcip or "Package Control: Install Package")


# Git

* git status (cmd-shift-P "Git status")


# Python Console

* open console (ctrl-`)

get a variable from settings file

    view.settings().get("sublimelinter_executable_map")
