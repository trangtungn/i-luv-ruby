# frozen_string_literal: true

# Adaptee
module AnimalAdaptees
  # dog
  module Dog
    def self.speak
      puts 'woof!'
    end
  end

  # cat
  module Cat
    def self.speak
      puts 'meow!'
    end
  end

  # owl
  module Owl
    def self.speak
      puts 'hoo!'
    end
  end
end
