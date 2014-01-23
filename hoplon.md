# What's neat

* compiles Clojurescript to HTML/JS
* sexp-based HTML syntax (functions yield DOM elements)
* DOM interactions are wired up by assigning event handlers to "on-[event]" attributes on elements
* Output is displayed reactively by assigning "do-[action]" attributes on elements


# Setup

Install Leiningen/Clojure

    http://leiningen.org/

Install Boot

    https://github.com/tailrecursion/boot

    git clone git@github.com:tailrecursion/boot.git
    cd boot
    make boot
    cp ./boot /somewhere/in/your/path

# Create a Project

    lein new hoplon my-project

# Run Boot

    cd my-project
    JVM_OPTS="-Xmx1g" boot watch hoplon

# Open rendered page

    open my-project/resources/public/index.html

