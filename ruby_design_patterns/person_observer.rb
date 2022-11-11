#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Person class
class Person
  attr_accessor :name, :status
  attr_reader :observers

  def initialize(name)
    @name = name
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def update_status(status)
    return if @status == status

    @status = status
    notify_observers
  end

  def notify_observers
    observers.each do |observer|
      observer.notify self
    end
  end

  def notify(person)
    puts "#{person.name}: #{person.status} - notified to #{name}"
  end
end

vel = Person.new 'Vel'
vel.add_observer Person.new('Murugan')
vel.add_observer Person.new('Swami')

vel.update_status 'Hello All!'
vel.update_status 'Hello there!'
