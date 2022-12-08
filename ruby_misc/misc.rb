#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

x = 1
$global_var = 'I\'m a global variable'
class MyClass
  # class variable
  @@class_var = 'I\'m a class variable'

  # getter for instance variable
  attr_reader :instance_var

  y = 2

  def initialize
    # instance variable start with @
    @instance_var = 'I\'m an instance variable'
  end

  def foo
    z = 4
    y ||= 0

    puts "z + y = #{z + y}"
  end

  define_method :bar do |x|
    z = 5
    puts "y = #{y}"
    y ||= 0

    puts "z + y + x = #{z + y + x}"
  end

  def who_r_u
    p 'who are you?'
    p @@class_var
    p @instance_var
  end

  def self.who_am_i
    p 'who am i?'

    p @@class_var
    p @instance_var
  end
end

my_class = MyClass.new
p 'instance variables: '
p my_class.instance_variables
p "instance_var value: #{my_class.instance_var}"
my_class.who_r_u
MyClass.who_am_i

p $global_var

p '-- foo:'
my_class.foo
p '-- bar(10):'
my_class.bar(10)
p '-- bar:'
my_class.bar
