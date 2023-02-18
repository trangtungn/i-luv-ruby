#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(n)
  longest = 0
  gap = 0

  binary = n.to_s(2)

  p binary

  binary.each_char do |char|
    if char == '1'
      longest = gap if gap > longest

      gap = 0
    else
      gap += 1
    end
  end

  longest
end

# 7
# 6
# 6172
# 9
# 529
# 20
# 15
# 32
# 1041
# 4
p solution(1)
p '-' * 10
p solution(5)
p '-' * 10
p solution(8)
p '-' * 10
p solution(9)
p '-' * 10
p solution(32)
p '-' * 10
p solution(11)
p '-' * 10
p solution(19)
p '-' * 10
p solution(1_376_796_946)
p '-' * 10
p solution(74_901_729)
