# The constructor for the Fiber class takes a block and returns a fiber object. 
# For now, the code in the block is not executed.
words = Fiber.new do 
  File.foreach("testfile") do |line|
    line.scan(/\w+/) do |word|
      Fiber.yield word.downcase
    end
  end
end

counts = Hash.new(0)

# Subsequently, we can call resume on the fiber object. 
# This causes the block to start execution. 
# The file is opened, and the scan method starts extracting individual words. 
# However, at this point, Fiber.yield is invoked. 
# This suspends execution of the block—the resume method that we called to run the block returns any value given to Fiber.yield.
#
# Our main program enters the body of the loop and increments the count for the first word returned by the fiber. 
# It then loops back up to the top of the while loop, which again calls words.resume while evaluating the condition. 
# The resume call goes back into the block, continuing just after it left off (at the line after the Fiber.yield call).
while word = words.resume
  counts[word] += 1
end

# When the fiber runs out of words in the file, the block exits. 
# The next time resume is called, it returns nil (because the block has exited). 
# You’ll get a FiberError if you attempt to call resume again after this.
counts.keys.sort.each {|k| print "#{k}:#{counts[k]} "}

# =>
# and:1 is:3 line:3 on:1 one:1 so:1 this:3 three:1 two:1



