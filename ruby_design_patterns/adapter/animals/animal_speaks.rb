#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require_relative 'animal_adapter'

animal = AnimalAdapter.new
animal.speak
animal.adapter = :cat
animal.speak
animal.adapter = :owl
animal.speak
