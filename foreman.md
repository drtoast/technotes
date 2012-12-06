# Documentation

* github: https://github.com/ddollar/foreman
* manpage: http://ddollar.github.com/foreman/
* getting started: http://blog.daviddollar.org/2011/05/06/introducing-foreman.html

# Usage

run one instance of each process defined in Procfile

    cd yourapp
    foreman start

run one instance of a specific process

    foreman start web

# Procfile

located in application root dir

    web: rails server -p 3000
    job: bundle exec rake jobs:work
