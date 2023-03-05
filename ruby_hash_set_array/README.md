# Use `Hash` or `Set` to keep track items

  1. Super market checkout: count unique items for special prices

      - Reference: dsa_challenges/tribex/check_out.rb
      - Customer is buying items:

            items = ['A', 'B', 'A', 'C', 'A', 'D']

      - Iterate `items` and add them to a Hash:

            unique_items = Hash.new(0)

            items.each do |i|
              unique_items[i] += 1
            end

  2. Mark leaves fell to the pond that a frog can jump to:

      - Reference: dsa_challenges/colidity/frog_river_one.rb

            falling_leaf_positions = [1, 4, 3, 2, 1, 3, 5, 2, 4]

            covered_positions = Set.new # OR Hash.new

            falling_leaf_positions.each do |pos|
              covered_positions << pos
            end

          OR

            covered_positions = {}

            falling_leaf_positions.each do |pos|
              covered_positions[pos] = true if covered_positions[pos].nil?
            end