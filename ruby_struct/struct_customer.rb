#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

Customer = Struct.new(:name, :address) do
  def greeting
    "Hello #{name}!"
  end
end

dave = Customer.new('Dave', '123 Main')
p dave.name     #=> "Dave"
p dave.greeting #=> "Hello Dave!"

# Create a structure with a name under Struct
Struct.new('Customer1', :name, :address)
#=> Struct::Customer
p Struct::Customer1.new('Dave 1', '123 Main 1').inspect
#=> #<struct Struct::Customer name="Dave", address="123 Main">

# Create a structure named by its constant
Customer2 = Struct.new(:name, :address)
#=> Customer2
p Customer2.new('Dave2', '123 Main 2').inspect
#=> #<struct Customer name="Dave", address="123 Main">
