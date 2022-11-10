#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require './square'
require 'pstore'

store = PStore.new('my_squares')
squares = []
store.transaction do
  squares = store[:square]
end

squares.each do |square|
  puts "Area = #{square.area}"
  puts "Perimeter = #{square.perimeter}"
  puts '=' * 80
end
