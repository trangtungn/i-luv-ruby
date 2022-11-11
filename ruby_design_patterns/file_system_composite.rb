#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Composite is a structural design pattern that allows composing objects into a tree-like structure
# and work with the it as if it was a singular object.

# Usage examples: The Composite pattern is pretty common in Ruby code.
# It\'s often used to represent hierarchies of user interface components or the code that works with graphs.

p 'Usage examples: The Composite pattern is pretty common in Ruby code. '
p 'It\'s often used to represent hierarchies of user interface components or the code that works with graphs.'

# Interface
class Component
  def size
    raise NotImplementedError.new, "#size is not implemented on #{self.class}"
  end

  def add(child); end

  def remove(child); end

  def get_child(_index)
    nil
  end
end

# Folder
class Folder < Component
  attr_reader :children

  def initialize
    @children = []

    super
  end

  def size
    children.collect(&:size).sum
  end

  def add(child)
    @children << child
  end

  def remove(child)
    @children.delete(child)
  end

  def get_child(index)
    children[index]
  end
end

# DocFile
class DocFile < Component
  def size
    size_on_disk
  end
end

documents = Folder.new
documents.add(DocFile.new)
documents.add(DocFile.new)

baking_recipes = Folder.new
baking_recipes.add(DocFile.new)

vegetable_recipes = Folder.new
vegetable_recipes.add(DocFile.new)
vegetable_recipes.add(DocFile.new)

all_recipes = Folder.new
all_recipes.add(baking_recipes)
all_recipes.add(vegetable_recipes)

file_system = Folder.new
file_system.add(documents)
file_system.add(all_recipes)
p file_system.children

# This creates the following structure:
#
# file_system
# |- documents
#    |- file
#    |- file
# |- all_recipes
#    |- baking_recipes
#    |  |- file
#    |- vegetable_recipes
#       |- file
#       |- file