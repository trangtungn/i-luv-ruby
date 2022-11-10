#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require './square'

s1 = Square.new
s1.side_length = 4
s2 = Square.new
s2.side_length = 7

require 'pstore'
store = PStore.new('my_squares')
store.transaction do
  store[:square] ||= []
  store[:square] << s1
  store[:square] << s2
end
