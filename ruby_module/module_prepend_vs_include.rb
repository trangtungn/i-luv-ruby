#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

module PrependModule
  def call
    puts "PrependModule: Before call"
    super
    puts "PrependModule: After call"
  end
end

module IncludeModule
  def call
    puts "IncludeModule: Before call"
    super
    puts "IncludeModule: After call"
  end
end

class BaseClass
  def call
    raise "BaseClass method call should not be called"
  end
end

class TestPrependVsInclude < BaseClass
  prepend PrependModule
  include IncludeModule

  def call
    puts "ExampleCommand: Main call"
  end
end

# order of execution
# call method in PrependModule
# call method in Main class
# call method in IncludeModule
puts TestPrependVsInclude.new.call
# PrependModule: Before call
# ExampleCommand: Main call
# PrependModule: After call

# Why PrependModule is called first?
# Because the `call` in PrependModule is the highest in the ancestors chain (method lookup path)
# So it will be executed first
# Then call method in Main class
# Then call method in IncludeModule
# To check the ancestors chain, we can use `ancestors` method
puts TestPrependVsInclude.ancestors
# PrependModule
# TestPrependVsInclude
# IncludeModule
# BaseClass
# Object
# Kernel
# BasicObject
