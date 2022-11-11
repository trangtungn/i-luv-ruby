#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Adaptee
class Slug
  def length_in_millis
    37
  end
end

# Adaptee
class Antelope
  def length_in_millis
    2400
  end
end

# Adaptee
class GrizzlyBear
  def length_in_inches
    78.7
  end
end

# adapter class that allows us to decorate an animal with the desired interface
class AnimalAdapter
  MILLIMETRES_IN_AN_INCH = 25

  def initialize(animal)
    @animal = animal
  end

  def length_in_millis
    @animal.length_in_inches * MILLIMETRES_IN_AN_INCH
  end
end

bear = GrizzlyBear.new
adapted_bear = AnimalAdapter.new(bear)
p adapted_bear.length_in_millis
