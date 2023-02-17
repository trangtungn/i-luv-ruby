#!/Users/trangtungn/.rbenv/shims/ruby -w

def solution(a, k)
  return a if k.zero?
  return a if a.empty? || a.length == 1
  return a if a.length.positive? && k > 1 && (a.length % k).zero?

  k.times do
    n = a.length
    last_item = a[n - 1]

    (n - 1).downto(1).each do |i|
      a[i] = a[i - 1]
    end

    a[0] = last_item
  end

  a
end

def solution2(a, k)
  return a if k.zero?
  return a if a.empty? || a.length == 1
  return a if a.length > 1 && k > 1 && (a.length % k).zero?

  xa = a.reverse
  k.times do
    first = xa.shift
    xa << first
  end

  xa.reverse
end

p solution([-1, 5], 0)
p solution([-1000, 5], 1)
p solution([3, 8, 9, 7, 6], 3)
p solution([0, 0, 0], 1)
p solution([1, 2, 3, 4], 4)
p solution([1], 3)
p solution([1, 1, 1, 3, 1, 5, 6, 7], 12)
p solution([1, 1, 3, 1, 5, 6], 12)
p solution([1, 1, 3, 100, 35, 6], 100)

p '-' * 80
p solution2([-1, 5], 0)
p solution2([-1000, 5], 1)
p solution2([3, 8, 9, 7, 6], 3)
p solution2([0, 0, 0], 1)
p solution2([1, 2, 3, 4], 4)
p solution2([1], 3)
p solution2([1, 1, 1, 3, 1, 5, 6, 7], 12)
p solution2([1, 1, 3, 1, 5, 6], 12)
p solution2([1, 1, 3, 100, 35, 6], 100)
