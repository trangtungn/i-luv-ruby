#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Mutex means Mutual Exclusion
# A Mutex object is used to ensure that
# only one thread can execute a block of code at a time.
# This prevents race conditions when threads access shared variables.
mutex = Mutex.new
x = y = 0
diff = 0

Thread.new do
  p "Thread 1"

  loop do
    p "Thread 1: #{x} - #{y}"
    mutex.synchronize do
      x += 1
      y += 1
    end
  end
end

Thread.new do
  p "Thread 2"

  loop do
    p "Thread 2: #{x} - #{y} = #{diff}"

    mutex.synchronize do
      diff += (x - y).abs
    end
  end
end
sleep(1) # Here main thread is put to sleep
puts "difference = #{diff}"
