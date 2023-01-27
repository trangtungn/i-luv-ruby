#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require 'benchmark'

# Foo
class Foo
  def bar
    p 'bar'
  end

  def qux
    p 'qux'
  end

  benchmark :bar, :qux
end

foo = Foo.new
foo.bar
# => bar took 0.12 ms
foo.qux
# => qux took 1.15 ms
