# frozen_string_literal: true

# Ruby 1.9 made proc() a synonym for Proc.new()
proc_test = proc { puts 'A proc is an object of Proc' }
proc_test.call
puts proc_test

multi_line_proc_with_arg_test = proc do |x|
  if x.nil?
    puts 'A proc does not check the number of arguments'
  else
    puts "A proc with argument: #{x}"
  end
end
multi_line_proc_with_arg_test.call
multi_line_proc_with_arg_test.call(3)

# Ruby 1.9, -> syntax for single line blocks
# and lambda syntax for multi-line blocks
lambda_test = -> { puts 'A lambda is an instance of Proc too' }
puts lambda_test.call

lambda_with_arg_test = ->(x) { puts "A single-line lambda with argument: #{x}" }
puts lambda_with_arg_test.call(5)

multi_line_lambda = lambda do |a, b|
  val = a * 2
  val += b
  puts "This is a multi-line lambda, calculus value: #{val}"
end

multi_line_lambda.call(1, 2)

begin
  puts lambda_with_arg_test.call
rescue ArgumentError
  puts 'A lambda checks the the number of arguments it receives ' \
    'and returns an ArgumentError if they do not match'
end

def proc_method_test
  puts 'When a Proc encounters a return statement in it\'s execution,'\
    'it halts the method and returns the provided value.'
  proc { return 1 + 1 }.call

  puts 'This line is never executed!'
end
proc_method_test

def lambda_math
  puts 'A lambda returns value to the method and allows it to continue:'
  total = -> { return 1 + 2 }.call

  puts "Lambda allows the method to continue; total: #{total}"
end
lambda_math

puts 'Pass a proc to functions as argument:'
print_number_proc_test = proc { |number| puts "number: #{number}" }
puts 'Use & before argument to initiate a Proc object and execute call function:'
3.times(&print_number_proc_test)

def method_with_proc_arg_test(proc)
  puts 'Execute call function:'
  proc.call
end
a_proc = proc { puts 'this proc is passed to a function' }
method_with_proc_arg_test(a_proc)
