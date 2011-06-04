# A mutex is like a bathroom pass. You create a mutex to control access 
# to a resource and then lock it when you want to use that resource. If no 
# one else has it locked, your thread continues to run. If someone else has 
# already locked that particular mutex, your thread suspends until they unlock it.

def inc(n)
  n+1
end

sum = 0
mutex = Mutex.new
threads = (1..10).map do
  Thread.new do
    100_000.times do
      mutex.synchronize do
        sum = inc(sum)  # one at a time, please
      end
      # SAME AS:
      # mutex.lock
      # sum = inc(sum)  # one at a time, please
      # mutex.unlock
    end
  end
end

threads.each(&:join)
p sum

# produces:
# 1000000