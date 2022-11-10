#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require 'yaml'
require './square'

squares = YAML.load_file('square.yaml', permitted_classes: [Square])
puts squares
squares.each do |square|
  puts "Area = #{square.area}"
  puts "Perimeter = #{square.perimeter}"
  puts '=' * 80
end
