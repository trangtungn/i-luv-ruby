# frozen_string_literal: true

def start
  puts 'Let\'s start'
end

# Module Star (*) character
module Star
  def self.line
    puts "Star self class: #{self.class}"
    puts '*' * 20
  end
end

# Module Dollar ($) character
module Dollar
  # rubocop:disable Style/ClassMethods
  def Dollar.line
    # rubocop:enable Style/ClassMethods

    puts "Dollar class: #{Dollar.class}"
    puts '$' * 20
  end
end

# Module At (@) character
module At
  def line
    puts "At instance: #{self.class}"
    puts '@' * 20
  end
end

# Module NewStar overrides the * character to +*+
module NewStar
  def Star.line
    puts 'NewStar.line Override Star.line: '
    puts '+*+' * 20
  end
end

start

# This one is called mixin
# rubocop:disable Style/MixinUsage
include At
# rubocop:enable Style/MixinUsage

# Object main: irb loads modules, functions to an Object, main
p 'Object main: irb loads modules, functions to an Object, main:'
p self
# an Object instance
p self.class

Dollar.line

puts '-' * 80
Star.line

puts '-' * 80
Dollar.line

puts '-' * 80
puts 'Notice that whenever we call NewStar.line, the line function in At module is called.'
puts 'It\’s because since we have defined it as Star.line in NewStar module, NewStar.line does not exist '
puts 'and hence the function line in the At module is called.'
NewStar.line

puts '-' * 80
line
