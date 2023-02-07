#!/Users/trangtungn/.rbenv/shims/ruby -rprofile
# frozen_string_literal: true

require 'profile'

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
p basket.total
