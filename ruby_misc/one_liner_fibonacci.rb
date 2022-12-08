#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

fibonacci = Hash.new { |h, k| h[k] = k < 2 ? k : h[k - 1] + h[k - 2] }

p fibonacci.inspect
p fibonacci[6]  # => 8
p fibonacci[50] # => 12586269025

# lambda
fibo = ->(x) { x < 2 ? x : fibo.call(x - 1) + fibo.call(x - 2) }
p fibo.inspect
p fibo[10]
