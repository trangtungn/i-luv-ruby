#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# A singleton method is a method that is defined for only one instance of a class.
# It becomes part of the object's singleton class (also known as eigenclass).
obj = Object.new
def obj.singleton_method
  puts "I'm a singleton method"
end

obj.define_singleton_method(:another_singleton_method) do
  puts "I'm another singleton method"
end

class << obj
  def one_more_singleton_method
    puts "I'm a different singleton method"
  end
end

obj.singleton_method
obj.another_singleton_method
obj.one_more_singleton_method

# Characteristics:
# Singleton methods are specific to the object they're defined on.
# They don't affect other instances of the same class.
# They're stored in the object's singleton class.
class Person
  def initialize(name)
    @name = name
  end
end

person1 = Person.new("Alice")
person2 = Person.new("Bob")

def person1.greet
  puts "Hello, I'm #{@name}"
end

person1.greet  # Output: Hello, I'm Alice
person2.greet  # NoMethodError: undefined method 'greet' for #<Person:...>
