#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# This solution has time complexity O(n*m)
def solution(s, p, q)
  p '**This solution has time complexity O(n*m)**'
  nucleotides = {
    'A' => 1,
    'C' => 2,
    'G' => 3,
    'T' => 4
  }

  arr_s = s.chars # string to array of characters
  arr = arr_s.map { |char| nucleotides[char] }

  num = p.size
  last = num - 1
  (0..last).map do |i|
    arr[p[i]..q[i]].min
  end
end

# This solution has time complexity O(n+m) -> good one!
def solution2(s, p, q)
  n = s.length
  m = p.length
  impact_factors = {
    'A' => 1,
    'C' => 2,
    'G' => 3,
    'T' => 4
  }
  prefix_sums = Array.new(n + 1) { [0, 0, 0, 0] }
  result = Array.new(m)

  # compute prefix sums of impact factors
  for i in 1..n
    nucleotide = s[i - 1]
    impact_factor = impact_factors[nucleotide]
    prefix_sums[i] = prefix_sums[i - 1].clone
    prefix_sums[i][impact_factor - 1] += 1

    p prefix_sums
  end

  p 'prefix_sums'
  p prefix_sums

  # for each query, find the minimal impact factor in the corresponding range
  for i in 0..(m - 1)
    from = p[i]
    to = q[i]
    count_a = prefix_sums[to + 1][0] - prefix_sums[from][0]
    count_c = prefix_sums[to + 1][1] - prefix_sums[from][1]
    count_g = prefix_sums[to + 1][2] - prefix_sums[from][2]
    count_t = prefix_sums[to + 1][3] - prefix_sums[from][3]
    if count_a > 0
      result[i] = 1
    elsif count_c > 0
      result[i] = 2
    elsif count_g > 0
      result[i] = 3
    else
      result[i] = 4
    end
  end

  return result
end

list_args = [
  ['CAGCCTA', [2, 5, 0], [4, 5, 6]]
]

list_args.each do |args|
  p "#1 - #{args}"
  p 'Note: this solution is O(n*m), just use for reference'
  p solution(*args)
  p "#2 - #{args}"
  p solution2(*args)
end
