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


# Packages

* install package (cmd-shift-P, pcip or "Package Control: Install Package")


# Git

* git status (cmd-shift-P "Git status")


# Python Console

* open console (ctrl-`)

get a variable from settings file

    view.settings().get("sublimelinter_executable_map")

