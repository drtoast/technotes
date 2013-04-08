# Sublime Text 3 compatible packages

* `https://github.com/wbond/sublime_package_control/wiki/Sublime-Text-3-Compatible-Packages`


# Install packages manually

    cd ~/Library/Application Support/Sublime Text 3/Packages

    git clone https://github.com/wbond/sublime_package_control.git "Package Control"
    cd "Package Control"
    git checkout python3

    git clone git://github.com/kemayo/sublime-text-2-git.git Git
    cd Git
    git checkout python3

    https://github.com/SublimeLinter/SublimeLinter/pull/358
    git clone https://github.com/SublimeLinter/SublimeLinter.git
    cd SublimeLinter
    git checkout sublime-text-3


# Help

* http://docs.sublimetext.info/en/latest/index.html


# Selecting

expand selection:

* to scope (cmd-shift-space)
* to line (cmd-L)
* to word (cmd-D), skip current instance (cmd-K)
* to indentation (cmd-shift-J)
* to brackets (ctrl-shift-M)
* to quotes (cmd-shift-Q), https://github.com/kek/sublime-expand-selection-to-quotes

multiple selection:

* select lines as multiple selection (cmd-shift-L)
* revert to single selection (esc)


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
* go to symbol in file (cmd-R foobar, cmd-P @foobar)
* go to symbol in project (cmd-shift-R)
* go to fuzzy text (cmd-P #foobar)
* go to line number (cmd-P :123, ctrl-G)
* move tab (cmd-alt-shift-left) https://github.com/sublimetext/movetab
* go to definition (cmd-opt-down)

in file:

* search within file (cmd-P#)
* page up/down (fn-arrow)

sidebar/console:

* show/hide console: (ctrl-`)
* reveal file in sidebar: (alt-.)
* go to sidebar (ctrl-0)
* go back to editor (esc)
* open/close console: (ctrl-`)


# Find/Replace

* find all and select in current file (cmd-F, opt-return)
* find all and replace in current file (cmd-opt-F)
* find all in multiple files (cmd-shift-F)
* toggle regexp (cmd-opt-R)
* toggle case sensitivity (cmd-opt-C)
* toggle whole word (cmd-opt-W)


# Packages

* install package (cmd-shift-P, pcip or "Package Control: Install Package")


# Git

* git status (cmd-shift-P "Git status")


# Python Console

* open console (ctrl-`)

get a variable from settings file

    view.settings().get("sublimelinter_executable_map")

