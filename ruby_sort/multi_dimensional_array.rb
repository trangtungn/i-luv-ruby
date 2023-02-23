#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

p '* 1. arr'
arr = [[-1, 'head', 0], [2, 'tail', 1], [1, 'head', 2], [1, 'tail', 0], [3, 'tail', 2], [0, 'head', 1]]
p arr

p '* 2. shuffled_arr'
shuffled_arr = arr.shuffle
p shuffled_arr

p '-' * 80
p "* 3. sort_by values: 'head' or 'tail'"
sort_by = arr.sort_by { |sub_arr| sub_arr[1] }
p sort_by

p 'Sub array is splatted in to 3 args => same result as above'
p 'A.'
sort_by_multi_args = arr.sort_by { |i, j, k| (i + k) }
p sort_by_multi_args

p 'B. Sort by reverse order'
sort_by_reverse_order = arr.sort_by { |i, j, k| -(i + k) }
p sort_by_reverse_order

p 'C. sort by (i+k), if equal, sort by j'
sort_by_multi_args = arr.sort_by { |i, j, k| [(i + k), j] }
p sort_by_multi_args
sort_by_multi_args = arr.sort_by { |i, j, k| [-(i + k), j] }
p sort_by_multi_args

p '-' * 80
p "* 4. Complex sort by 2 or more columns: index 1: 'head'/'tail' and index 0"
p 'Operator <=> returns -1 (asc), 0, 1 (desc))'
p 'Ex: a <=> b returns -1 if a < b; 0 if a = b; 1 if a > b'
p 'Sort Descending by index 1 (tail > head)'
sort_arr = arr.sort { |a, b| b[1] <=> a[1] }
p sort_arr

p 'Ex: Desc by index 1 (tail > head) and asc by index 0'
complex_sort_arr = arr.sort { |a, b| a[1] == b[1] ? (a[0] <=> b[0]) : (b[1] <=> a[1]) }
p complex_sort_arr
