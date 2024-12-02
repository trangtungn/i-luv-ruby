#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

BEGIN {
   puts 'BEGIN code block - is executed in the order they are encountered'
}

at_exit do
  puts 'END code block - is executed in reverse order (bottom up)'
end

# MAIN block code
puts 'MAIN code block'

def block_test
  puts '- block_test starts...'
  yield 5 if block_given?
  puts '- block_test ends.'
end

block_test
block_test { puts 'a block is yielded!' }
block_test { |n| puts "a block is yielded with argument: #{n}!" }

puts '----'

puts 'Use & to pass a proc to functions as argument:'
def block_as_func_test(&block)
  p '- block_as_func_test starts...'
  p '- block is instantiated as a Proc object:'
  p block
  p '- block is called:'
  block.call
  p '- block_as_func_test ends.'
end
block_as_func_test { puts 'Hello World!' }

def yield_test
  p 'yield a block'
  yield
end

yield_test { p 'this is a block' }
