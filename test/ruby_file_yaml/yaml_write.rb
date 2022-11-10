#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require 'yaml'
require './square'

s = Square.new 17
s1 = Square.new 34
squares = [s, s1]

File.open('square.yaml', 'w') do |f|
  f.puts YAML.dump(squares)
end
