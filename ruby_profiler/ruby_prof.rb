#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require 'ruby-prof'

# profile the code
profile = RubyProf::Profile.new
profile.start

# Check out items in supermarket
class Basket
  attr_accessor :items

  def initialize(items)
    @items = Hash.new(0)
    items.each { |i| @items[i] += 1 }
  end

  def total
    items.reduce(0) do |total, (_key, val)|
      total + val
    end
  end
end

basket = Basket.new([*?a..?z, *'a'..'z']) # splat a -> z
p "Total: #{basket.total}"

# ... code to profile ...
result = profile.stop
# print a flat profile to text
printer = RubyProf::FlatPrinter.new(result)
printer.print($stdout)
printer = RubyProf::GraphPrinter.new(result)
printer.print(STDOUT, {})
