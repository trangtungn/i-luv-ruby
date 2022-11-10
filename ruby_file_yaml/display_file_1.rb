#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

puts File.open('something.txt').readlines

File.open('something.txt').each_with_index { |line, i| puts "#{i}. #{line}" }

File.open('something.txt').each_byte { |byte| puts byte }

File.open('something.txt').each_char { |a| puts a }
