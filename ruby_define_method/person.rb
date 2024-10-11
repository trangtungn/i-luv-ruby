#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# `define_method` is a powerful metaprogramming feature that lets you create methods on the fly
class Person
  def fred
    puts "In Fred"
  end

  def create_method(name, &block)
    self.class.send(:define_method, name, &block)
  end

  define_method(:wilma) { puts "Charge it!" }
end

class AnotherPerson < Person
  define_method(:barney, instance_method(:fred))
end

a = AnotherPerson.new
a.barney
a.wilma
a.create_method(:betty) { p self }
a.betty
