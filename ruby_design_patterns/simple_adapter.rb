#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Adapter
class Animal
  module Adapter
    # Adaptee
    module Dog
      def self.speak
        puts 'woof!'
      end
    end

    # Adaptee
    module Cat
      def self.speak
        puts 'meow!'
      end
    end

    # Adaptee
    module Owl
      def self.speak
        puts "hoo!"
      end
    end
  end

  def speak
    adapter.speak
  end

  def adapter
    return @adapter if @adapter

    self.adapter = :dog
    @adapter
  end

  def adapter=(adapter)
    @adapter = Animal::Adapter.const_get(adapter.to_s.capitalize)
  end
end

animal = Animal.new
animal.speak
animal.adapter = :cat
animal.speak
animal.adapter = :owl
animal.speak
