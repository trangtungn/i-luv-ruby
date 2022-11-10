# frozen_string_literal: true

# this is a class
class Square
  attr_accessor :side_length

  def initialize(side_length = 0)
    @side_length = side_length
  end

  def area
    @side_length * @side_length
  end

  def perimeter
    4 * @side_length
  end
end
