#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

grades = Hash.new
grades['Dorothy Doe'] = 9
p grades

# Hashes have a default value
grades = Hash.new(0)
p grades[:a] # 0
p grades['b'] # 0

# OR by using the default= method
grades = { 'Timmy Doe' => 8 }
grades.default = 0

p grades['Jane Doe'] # 0
