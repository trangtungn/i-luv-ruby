#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Meet Fiber, Thread's Cooperative Cousin
# https://thoughtbot.com/blog/meet-fiber-thread-s-cooperative-cousin
odd_fiber = Fiber.new do
  Fiber.yield 1
  3
end

even_fiber = Fiber.new do
  Fiber.yield 2
  4
end

puts odd_fiber.resume
puts even_fiber.resume
puts odd_fiber.resume
puts even_fiber.resume

# Ruby’s Enumerator
# Under the hood this is implemented with a fiber that yields each value in turn,
# pausing execution and resuming when the next value is requested.
enumerator = [1, 2, 3].reverse_each
p enumerator.next
p enumerator.next
p enumerator.next
