#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

class Person
  # Method 1: Direct definition
  def self.class_method1
    puts "I'm class method 1"
  end

  # Method 2: Using the eigenclass
  class << self
    def class_method2
      puts "I'm class method 2"
    end

    # Method 3: Using `define_method`
    define_method(:class_method3) do
      puts "I'm class method 3"
    end
  end
end

Person.class_method1  # Output: I'm class method 1
Person.class_method2  # Output: I'm class method 2
Person.class_method3  # Output: I'm class method 3


class AnotherPerson
end

AnotherPerson.define_singleton_method(:class_method4) do
  puts "I'm class method 4"
end

AnotherPerson.instance_eval do
  def class_method5
    puts "I'm class method 5"
  end
end

AnotherPerson.class_eval do
  define_singleton_method(:class_method6) do
    puts "I'm class method 6"
  end
end

AnotherPerson.class_method4  # Output: I'm class method 4
AnotherPerson.class_method5  # Output: I'm class method 5
AnotherPerson.class_method6  # Output: I'm class method 6
