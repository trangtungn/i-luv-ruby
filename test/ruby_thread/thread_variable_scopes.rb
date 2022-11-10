#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

variable = 0
puts "Before thread variable = #{variable}"
a = Thread.new do
  variable = 5
  thread_variable = 72
  puts "Inside thread thread_variable = #{thread_variable}"
end
a.join
puts "=================\nAfter thread\nvariable = #{variable}"
puts "thread_variable = #{thread_variable}"
