http://bashdb.sourceforge.net/ruby-debug.html

# Rspec

run with "-d" flag

# Debug statements (in code)

debugger - stop debugger at this point


# Debugger command line

(s)tep - step forward to the next statement
(n)ext - run next statement, skipping over functions
(c)ontinue - continue to the next breakpoint
    c 15 - continue to line 15
(f)inish - finish execution
(p)uts - print the value of a variable
(l)ist - list surrounding lines of code
(q)uit - quit

(b)reak /Users/toast/code/topaz/app/models/diagnostic_report.rb:27 - add a breakpoint
    b 28 - add a breakpoint at line 28 of current file