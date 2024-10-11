#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

module ExtendModule
  def class_call
    puts "ExtendModule: Class method call"
  end
end

class TestPrependVsIncludeCmd
  extend ExtendModule

  def call
    puts "TestPrependVsIncludeCmd: Main call"
    "Result from TestPrependVsIncludeCmd"
  end
end

# Class method call
puts "\nClass method call:"
TestPrependVsIncludeCmd.class_call

puts "\nAncestor chain:"
puts TestPrependVsIncludeCmd.ancestors

puts "\nSingleton class methods:"
puts TestPrependVsIncludeCmd.singleton_methods
