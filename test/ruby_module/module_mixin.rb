#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

puts $VERBOSE

# Shebang
# The "she" part is the octothorp (#), aka pound sign, number sign, hash mark,
# and now hash tag (I still call it tic-tac-toe just cuz).
# The "bang" part is the exclaimation mark (!),
# and it's like banging your fist on the table to exclaim the command.
# -w: is a flag instruction for ruby to turn on warning

# This module is a mixin which will be used in other classes
# A mixin can be shared between classes, put it into module and share it.
module Constants
  PI = 22.0 / 7
end

# this class uses a mixin
class Circle
  include Constants
  attr_accessor :radius

  def area
    PI * radius * radius
  end
end

# this class uses a mixin
class Sphere
  include Constants
  attr_accessor :radius

  def volume
    (4.0 / 3) * PI * radius**3
  end
end

c = Circle.new
c.radius = 7
s = Sphere.new
s.radius = 7
puts "Circle Area = #{c.area}"
puts "Sphere Volume = #{s.volume}"
