#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/

def proc_returns_from_top_level_context
  puts "Before proc"
  my_proc = Proc.new { return 2 }
  my_proc.call
  puts "After proc"
end

# This will return 2 and then exit the method, so the string 'After proc' will never be reached.
proc_returns_from_top_level_context

t = Proc.new { |x,y| puts "I don't care about arguments!" }
t.call

# Should work
my_lambda = -> { return 1 }
puts "Lambda result: #{my_lambda.call}"
# Should raise exception
# my_proc = Proc.new { return 1 }
# puts "Proc result: #{my_proc.call}"

# Closure
def call_proc(my_proc)
  count = 500
  my_proc.call
end

count   = 1
my_proc = Proc.new { puts count }

# It would seem like 500 is the most logical conclusion, but because of the `closure` effect this will print 1.
# This happens because the proc is using the value of count from the place where the proc was defined, and that's outside of the method definition.
call_proc(my_proc) # What does this print?
