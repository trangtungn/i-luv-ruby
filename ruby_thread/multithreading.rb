#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def func(name, delay)
  i = 0
  while i <= 2
    puts "#{name} #{Time.now}"
    sleep delay
    i += 1
  end
end

puts "Started At #{Time.now}"
t1 = Thread.new { func 'Thread 1:', 2 }
t2 = Thread.new { func 'Thread 2:', 3 }
t1.join
t2.join
puts "End at #{Time.now}"
