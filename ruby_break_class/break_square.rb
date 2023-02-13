# frozen_string_literal: true

# square class
class Square
  attr_accessor :side_length

  def perimeter
    @side_length * 4
  end
end
