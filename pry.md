# Setup

    rvm gemset use global
    gem install pry
    pry -r ./config/environment

# Debugger

    p = UnitTokenPresenter.new(User.find(513))
    cd p
    edit-method all_tokens   # add "binding.pry" to method and close
    all_tokens               # run the method


# Help
    help               Show a list of commands. Type `help <foo>` for information about <foo>.

# Context
    cd                 Move into a new context (object or scope).
    find-method        Recursively search for a method within a Class/Module or the current namespace. find-method [-n | -c] METHOD [NAMESPACE]
    ls                 Show the list of vars and methods in the current scope.
    pry-backtrace      Show the backtrace for the Pry session.
    raise-up           Raise an exception out of the current pry instance.
    reset              Reset the REPL to a clean state.
    whereami           Show code surrounding the current context.
    wtf?               Show the backtrace of the most recent exception

# Editing
    !                  Clear the input buffer. Useful if the parsing process goes wrong and you get stuck in the read loop.
    amend-line         Amend a line of input in multi-line mode.
    edit               Invoke the default editor on a file.
    edit-method        Edit the source code for a method.
    hist               Show and replay Readline history. Aliases: history
    play               Play back a string variable or a method or a file as input.
    show-input         Show the contents of the input buffer for the current multi-line expression.

# Introspection
    ri                 View ri documentation. e.g `ri Array#each`
    show-command       Show the source for CMD.
    show-doc           Show the documentation for a method or class. Aliases: ?
    show-source        Show the source for a method or class. Aliases: $, show-method
    stat               View method information and set _file_ and _dir_ locals.

# Input and output
    .<shell command>   All text following a '.' is forwarded to the shell.
    cat                Show code from a file, Pry's input buffer, or the last exception.
    save-file          Export to a file using content from the REPL.
    shell-mode         Toggle shell mode. Bring in pwd prompt and file completion.

# Navigating pry
    !pry               Start a Pry session on current self; this even works mid multi-line expression.
    exit               Pop the previous binding (does NOT exit program). Aliases: quit
    exit-all           End the current Pry session (popping all bindings) and returning to caller. Accepts optional return value. Aliases: !!@
    exit-program       End the current program. Aliases: quit-program, !!!
    jump-to            Jump to a binding further up the stack, popping all bindings below.
    nesting            Show nesting information.
    switch-to          Start a new sub-session on a binding in the current stack (numbered by nesting).

# Gems
    gem-cd             Change working directory to specified gem's directory.
    gem-install        Install a gem and refresh the gem cache.
    gem-list           List and search installed gems.

# Commands
    import-set         Import a command set
    install-command    Install a disabled command.

# Aliases
    !!!                Alias for `exit-program`
    !!@                Alias for `exit-all`
    $                  Alias for `show-source`
    ?                  Alias for `show-doc`
    breakpoint         Alias for `break`
    breaks             Alias for `breakpoints`
    clipit             Alias for `gist --clip`
    file-mode          Alias for `shell-mode`
    history            Alias for `hist`
    jist               Alias for `gist`
    quit               Alias for `exit`
    quit-program       Alias for `exit-program`
    show-method        Alias for `show-source`

# Gist
    gist               Gist a method or expression history to GitHub.

# Misc
    pry-version        Show Pry version.
    reload-method      Reload the source file that contains the specified method
    simple-prompt      Toggle the simple prompt.
    toggle-color       Toggle syntax highlighting.

# pry-debugger (v0.2.0)
    break              Set or edit a breakpoint.
    breakpoints        List defined breakpoints.
    continue           Continue program execution and end the Pry session.
    finish             Execute until current stack frame returns.
    next               Execute the next line within the current stack frame.
    step               Step execution into the next line or method.
