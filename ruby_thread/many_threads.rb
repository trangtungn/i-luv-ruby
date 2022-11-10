#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def launch_thread(string)
  Thread.new do
    3.times do
      puts string
      sleep rand(3)
    end
  end
end

threads = []

puts 'How many threads should run?'
count = gets.to_i

count.times do |i|
  threads << launch_thread("Thread #{i}")
end

threads.each(&:join)
