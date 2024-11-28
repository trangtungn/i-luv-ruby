#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require 'net/http'

# Async Ruby on Rails
# https://thoughtbot.com/blog/async-ruby-on-rails
class BaseService
  def initialize(num, name)
    @num = num
    @name = name
  end

  def results
    Net::HTTP.get(URI.parse("https://httpbin.org/delay/2"))
    p "#{@name} - Requested I/O"

    arr = Array.new(@num, @name)
    arr.join(" ")
  end
end

class ServiceA < BaseService
  def initialize(num)
    super(num, 'A')
  end
end

class ServiceB < BaseService
  def initialize(num)
    super(num, 'B')
  end
end

class ServiceC < BaseService
  def initialize(num)
    super(num, 'C')
  end
end

def sync_searches
  search_services = { a: ServiceA.new(5), b: ServiceB.new(5), c: ServiceC.new(5) }

  search_services.map do |name, search|
    p "#{name.to_s.upcase} - Executing..."
    search.results
  end
end

def async_searches
  search_services = { a: ServiceA.new(5), b: ServiceB.new(5), c: ServiceC.new(5) }

  search_services.map do |name, search|
    Thread.new do
      p "#{name.to_s.upcase} - Executing..."
      search.results
    end
  end.map(&:value)
end

require "benchmark"

# Benchmark
p "=" * 24
p "Benchmark"

Benchmark.bm(24) do |bm|
  # Sync searches
  bm.report('Sync searches\n') do
    sync_searches
  end

  # Async searches
  bm.report('Async searches\n') do
    async_searches
  end
end

# Realtime benchmark
p "=" * 24
p "Realtime benchmark"

puts(
  "=== Sync: ",
  Benchmark.realtime do
    sync_searches
  end
)

puts(
  "=== Async: ",
  Benchmark.realtime do
    async_searches
  end
)
