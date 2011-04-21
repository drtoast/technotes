https://github.com/tmm1/perftools.rb

# Install

    gem install perftools.rb
    brew install ghostscript graphviz

# Usage

1. set environment variables:

    CPUPROFILE_REALTIME=1  # use walltime instead of cputime
    CPUPROFILE_METHODS=1  # profile method calls

2. add to code:

``` ruby
require 'perftools'
PerfTools::CpuProfiler.start("/tmp/your_profile")
  # do stuff...
PerfTools::CpuProfiler.stop
```

3. run!

4. view results:

    pprof.rb --text /tmp/your_profile
    pprof.rb --pdf /tmp/your_profile > ~/Desktop/your_profile.pdf

# Analyze Output

http://google-perftools.googlecode.com/svn/trunk/doc/cpuprofile.html#pprof

## Text mode:

    14   2.1%  17.2%       58   8.7% std::_Rb_tree::find

Here is how to interpret the columns:

* Number of profiling samples in this function
* Percentage of profiling samples in this function
* Percentage of profiling samples in the functions printed so far
* Number of profiling samples in this function and its callees
* Percentage of profiling samples in this function and its callees
* Function name

## Graphical mode:

* Class Name
* Method Name
* local (percentage) - time spent only in this procedure
* of cumulative (percentage) - time spent in this procedure and its callees