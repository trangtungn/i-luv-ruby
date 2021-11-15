# frozen_string_literal: true

# This class is a class as parent class
class A
  attr_reader :name, :address

  def initialize(name, **address)
    @name = name
    @address = address
  end

  def info
    p name
    p 'info:'
    p address
  end
end

a = A.new('Tester A', address: { street: 'aaa', city: 'HCM' })
a.info

# This class is a class as child class
class B < A
  attr_reader :email

  def initialize(name, address: {}, email: nil)
    super
    @email = email
  end

  def info(msg)
    p "#{name} says: '#{msg}'"
    super()
  end
end

b = B.new(
  'Tester B', address: { street: 'bbb', city: 'HCM' }, email: 'tester@test.co'
)
b.info('hello world!')

# This class is a class
class C
  @no_of_customers = 0

  def initialize(id, name, addr)
    @id = id
    @name = name
    @addr = addr
  end

  def no_of_customers
    @@no_of_customers # you can access class variable without offense
  end

  def self.test(name)
    class_variable_get("@@#{name}") # you can access without offense
  end
end
