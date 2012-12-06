pids = []
start = 0
NUM_PROCS.times do
  pids << fork do
    ActiveRecord::Base.establish_connection
    loop do
      period = periods[start += NUM_PROCS]
      break unless period
      extract_period(relation, period, blk)
    end
  end
  start += 1
end

pids.map { |pid| Process.waitpid(pid) }