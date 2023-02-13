#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# tree node
class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end

# binary tree
class BinaryTree
  attr_accessor :root

  def initialize(array)
    @root = TreeNode.new(array.shift)
    array.each do |value|
      add_node(root, value)
    end
  end

  def add_node(node, value)
    if value <= node.value
      if node.left
        add_node(node.left, value)
      else
        node.left = TreeNode.new(value)
      end
    elsif node.right
      add_node(node.right, value)
    else
      node.right = TreeNode.new(value)
    end
  end

  def print_tree(node)
    puts node.value
    if node.left
      puts "/ #{node.value}"
      print_tree(node.left)
    end

    return unless node.right

    puts "#{node.value} \\"
    print_tree(node.right)
  end

  def total
    @total = 0

    total_left(root)
  end

  def pick
    pick_left_node(root)
  end

  private

  def total_left(node)
    if node.left
      @total += node.left.value
      p "left: #{node.left.value} - total: #{@total}"
      total_left(node.left)
    end

    total_left(node.right) if node.right

    @total
  end

  def pick_left_node(node, arr = [])
    if node.left
      arr << node.left.value
      pick_left_node(node.left, arr)
    end

    pick_left_node(node.right, arr) if node.right

    arr
  end
end

# array = [1, 2, 3, 4, 5, 6]
# array = [5, 4, 6, 3, 7]
array = [10, 5, 15, 3, 7, 12, 17, 2, 4, 6, 8, 11, 13, 16, 18]
tree = BinaryTree.new(array)
tree.print_tree(tree.root)

p '-' * 80
p 'Total all left nodes - Solution 1:'
p "total: #{tree.total}"

p '-' * 80
p 'Total all left nodes - Solution 2:'
p tree.pick.sum
