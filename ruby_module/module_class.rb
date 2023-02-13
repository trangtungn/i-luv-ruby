#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Shebang
# The "she" part is the octothorp (#), aka pound sign, number sign, hash mark,
# and now hash tag (I still call it tic-tac-toe just cuz).
# The "bang" part is the exclaimation mark (!),
# and it's like banging your fist on the table to exclaim the command.
# -w: is a flag instruction for ruby to turn on warning

module Instrument
  # this is an Instrument::Ruler class
  class Ruler
    def what_u_do?
      puts 'I take measurements'
    end
  end
end

module People
  # this is an People::Ruler class
  class Ruler
    def what_u_do?
      puts 'I govern this land'
    end
  end
end

r1 = People::Ruler.new
r2 = Instrument::Ruler.new

r1.what_u_do?
r2.what_u_do?
