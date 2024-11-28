#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

p '---'
p 'Mostly | is a method not an operator'
p 'With TrueClass, it is a single pipe'
p 'With Fixnum, it is a bitwise OR'
p 'With Array, it is a union: array | other_array -> new_array; duplicates are removed, order is preserved'
p '---'

def action1
  p 'action 1'
  true
end

def action2
  p 'action 2'
  false
end

def result_action
  p 'hi there'
end

p '1 ---'
# Output:
# action 1
# hi there
result_action if action1 || action2

p '2 ---'
# Output:
# action 1
# action 2
# hi there
result_action if action1 | action2

def arr1
  [1, 2, 3, 4]
end

def arr2
  [3, 4]
end

p '3 --- arr1 | arr2 ---'
# remove duplicates AND preserve order
p arr1 | arr2 # [1, 2, 3, 4]

p '4 --- arr1 + arr2 ---'
p arr1 + arr2 # [1, 2, 3, 4, 3, 4]

p '5 --- arr1 || arr2 ---'
p arr1 || arr2 # [1, 2, 3, 4]

p '6 --- bitwise OR ---'
p 'bitwise OR'
p 133 | 224
