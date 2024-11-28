#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

p <<~INTRO
  The main idea is that whenever you don\'t want to specify the number of arguments you have,
  you would use a splat operator.
INTRO

one = 'first'
two = 'second'
three = 'third'

arr = %w[first second third]

# makes three arguments
def group_array_args(*args)
  p args
end

p '1. Group params (array) to array'
group_array_args(arr) # [["first", "second", "third"]]

p '2. Group params (n variable) to array'
def group_variables(*args)
  p args
end

group_variables(one, two, three) # ["first", "second", "third"]

p '3. Splat array to array.length params'
def array_to_args(one, two, three)
  p one, two, three
end

array_to_args(*arr) # first second third

p '4. Grab array in to segments'
def grab_array_segments
  first, *rest, last = %w[a b c d]

  p first # "a"
  p rest # ["b", "c"]
  p last # "d"
end

grab_array_segments
