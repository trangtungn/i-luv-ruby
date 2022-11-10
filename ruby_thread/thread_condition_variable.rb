#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

mutex = Mutex.new

c = ConditionVariable.new
a = Thread.new do
  mutex.synchronize do
    puts 'Thread a now waits for signal from thread b'
    c.wait(mutex)
    puts 'a now has the power to use the resource'
  end
end

puts '(Now in thread b....)'

b = Thread.new do
  mutex.synchronize do
    puts 'Thread b is using a resource needed by a, once its done it will signal to a'
    sleep(4)
    c.signal
    puts 'b Signaled to a to acquire resource'
  end
end

a.join
sleep(1)
b.join

# Deadlock happens
# b.join
