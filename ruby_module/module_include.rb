#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

module IncludeModule
  def self.included(base)
    puts "IncludeModule has been included in #{base}"
    base.extend(ClassMethods)
  end

  module ClassMethods
    def class_method_example
      puts "This is a class method added by IncludeModule"
    end
  end

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

class TestInclude < BaseClass
  include IncludeModule

  def call
    puts "ExampleCommand: Main call"
  end
end

puts TestInclude.class_method_example


puts TestInclude.ancestors
