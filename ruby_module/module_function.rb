#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# module Start sign
module Star
  def line
    puts '*' * 20
  end
end

# module Dollar sign
module Dollar
  def line
    puts '$' * 20
  end
end

# rubocop:disable Style/MixinUsage
include Star
# rubocop:enable Style/MixinUsage
line

puts 'Dollar'

# rubocop:disable Style/MixinUsage
include Dollar
# rubocop:enable Style/MixinUsage
line

module Something
  puts 'Something'
end

module Nothing
  puts 'Nothing'
end
