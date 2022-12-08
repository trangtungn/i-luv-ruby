# frozen_string_literal: true

require_relative 'animal_adaptees'

# Adapter
class AnimalAdapter
  include AnimalAdaptees

  def speak
    adapter.speak
  end

  def adapter
    return @adapter if @adapter

    self.adapter = :dog
    @adapter
  end

  def adapter=(adapter)
    @adapter = AnimalAdaptees.const_get(adapter.to_s.capitalize)
  end
end
