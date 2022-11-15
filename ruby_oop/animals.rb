#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

puts '---Animal method lookup---'
puts Animal.ancestors

fido = Animal.new
fido.speak

fido.walk

class GoodDog < Animal
  include Swimmable
  include Climbable

  DOG_YEARS = 7

  attr_accessor :name

  def initialize(name, age)
    super()

    self.name = name
    self.age = age
  end

  def public_disclosure
    p "#{name} in human years is #{human_years}"
  end

  protected

  attr_accessor :age

  private

  def human_years
    age * DOG_YEARS
  end
end

puts '---GoodDog method lookup---'
puts GoodDog.ancestors

module Mammal
  class Dog
    def speak(sound)
      p "I sound: #{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "My name is: #{name}"
    end
  end

  def self.some_out_of_place_method(num)
    num**2
  end
end

buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak('Arf!')           # => "Arf!"
kitty.say_name('kitty')

value = Mammal.some_out_of_place_method(4)
p '--- value'
p value

sparky = GoodDog.new('Sparky', 4)
p sparky.name
sparky.public_disclosure
