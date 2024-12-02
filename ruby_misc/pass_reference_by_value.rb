#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def reassign(array)
  # the array argument is a value, or the address pointing to array's values
  # this address is duplicated and past to this function
  p "array arg: #{array}"

  # this array is a new array, inside reassign function scope
  array = [0, 1]
  p "array arg - after: #{array}"
  array
end

def append(array)
  array << 1
end

array = [0]
p reassign(array)
p "--- reassigned array: #{array}"
p append(array)
p "--- appended array: #{array}"

array_a = [0]
array_b = array_a
array_b << 1
print array_a
