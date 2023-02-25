#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a, b)
  arr_a = a.chars
  arr_b = b.chars
  return false if arr_a.empty? || arr_b.empty?

  na = arr_a.size
  nb = arr_b.size

  return false if nb > na

  k = 0
  arr_b.each do |char_b|
    result = false
    (k...na).each do |i|
      next if arr_a[i] != char_b

      result = true
      k = i + 1
      break
    end

    return false if result == false
  end

  true
end

args = [
  ['a', 'a'],
  ['a', 'b'],
  ['a', 'ab'],
  ['ABCD', 'AC'],
  ['ABCD', 'CA'],
  ['ABCAD', 'ABA'],
  ['ABCDEF', 'EF'],
  ['ABCDEF', 'AB'],
  ['ABCDEF', 'BA'],
  # ['ABCDEF', 'ABCDEF'],
  # ['ABCDEF', 'BCDEF'],
]

args.each_with_index do |arg, i|
  p '-' * 10
  p i + 1
  p solution(*arg)
end
