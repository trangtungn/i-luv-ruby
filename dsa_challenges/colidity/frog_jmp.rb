#!/Users/trangtungn/.rbenv/shims/ruby -w

def solution(x, y, d)
  return 0 if x == y
  return 1 if d > y

  length = y - x
  return 1 if d > length

  even_jumps = length / d
  remainder = length % d

  return even_jumps if remainder == 0

  even_jumps + 1
end

def solution2(x, y, d)
  distance = y - x
  jumps = (distance / d.to_f).ceil
  jumps
end

solution(1, 1, 20)
solution(1, 1, 1)
solution(1, 2, 1)
solution(1, 2, 1000)
solution(100, 1000, 11)
solution(100, 1000, 9)
