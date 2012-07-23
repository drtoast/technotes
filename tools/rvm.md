# Installing non-LLVM rubies

install https://github.com/kennethreitz/osx-gcc-installer, then

    CC=/usr/bin/gcc-4.2 rvm install ruby-1.8.7-p302
    rvm gemset create ruby-1.8.7-p302@wellspace
    gem install bundler

# Switch ruby version

show available rubies

    rvm list

use latest 1.9.2

    rvm use 1.9.2

set default

    rvm --default ruby-1.9.2-p180
  
# Gemsets
  
list gemsets

    rvm list gemsets

create gemset

    rvm --create 1.9.2@railspre

install rails release candidate in that gemset

    gem install rails --pre

# User .rvmrc

    export rvm_path="/Users/toast/.rvm"

# Project .rvmrc

    rvm --create ruby-1.9.2-p180@toastunes
