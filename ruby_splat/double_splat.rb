#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def doublesplat(**nums)
  p nums
end

doublesplat one: 1, two: 2 # {:one=>1, :two=>2}

p 'Complex arguments'
def dub_splat(first_arg, *second_args, **third_args)
  p first_arg
  p second_args
  p third_args
end

dub_splat(1, 2, 3, 4, a: 40, b: 50) # {:a=>40, :b=>50}
