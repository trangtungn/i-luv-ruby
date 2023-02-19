# Notes

# Approach problems

## Convert `Hash` to `Array`

Reference: dsa_challenges/tribex/mars_rover2.rb

Example:

    DIRECTIONS = {
      'North' => 0,
      'East' => 1,
      'South' => 2,
      'West' => 3
    }

OR

    DIRECTIONS = {
      0 => 'North',
      1 => 'East',
      2 => 'South',
      3 =>'West'
    }

=> It should be an Array, convert:

    DIRECTIONS = %w[North East South West]

## Iterate back and forth

Reference: dsa_challenges/tribex/mars_rover2.rb

Example:

    DIRECTIONS = %w[North East South West]

    current_direction = 0 # DIRECTIONS[current_direction] => 'North'

+ if `current_direction = 0` => 'North', then turn left: `(0 - 1) % 4 => 3` which is 'West'

      def turn_left(current_direction)
        current_direction = (current_direction - 1) % DIRECTIONS.length
      end

+ if `current_direction = 0` => 'North', then turn right: `(0 + 1) % 4 => 1` which is 'East'

      def turn_right
        current_direction = (current_direction + 1) % DIRECTIONS.length
      end

## Array Index

  ![Index](../assets/images/array_indices.svg)

