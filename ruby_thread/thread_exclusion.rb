#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Mutex means Mutual Exclusion
mutex = Mutex.new
x = y = 0
diff = 0
Thread.new do
  loop do
    mutex.synchronize do
      x += 1
      y += 1
    end
  end
end
Thread.new do
  loop do
    mutex.synchronize do
      diff += (x - y).abs
    end
  end
end
sleep(1) # Here main thread is put to sleep
puts "difference = #{diff}"
