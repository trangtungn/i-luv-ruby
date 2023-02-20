#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(n, a)
  counters = Array.new(n, 0)

  limit = n + 1
  max_counter = 0
  a.each_with_index do |val, idx|
    next if val > limit

    if val >= 1 && val <= n
      counters[val - 1] += 1
      max_counter = counters[val - 1] if max_counter < counters[val - 1]
    end

    counters = Array.new(n, max_counter) if val == limit
  end

  counters
end
