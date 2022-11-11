#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Person class
require 'observer'

### Periodically fetch a stock price.
class Ticker
  include Observable

  def initialize(symbol)
    @symbol = symbol
  end

  def run
    last_price = nil
    loop do
      price = Price.fetch(@symbol)

      if Price.changed?(price, last_price)
        # notify observers
        changed
        last_price = price
        notify_observers(Time.now, price)
      end

      sleep 1
    end
  end
end

### A mock class to fetch a stock price (60 - 140).
class Price
  def self.fetch(_symbol)
    rand(60..139)
  end

  def self.changed?(price, another_price)
    puts "Current price: #{price} - Last price: #{another_price}"
    price != another_price
  end
end

### An abstract observer of Ticker objects.
class Warner
  def initialize(ticker, limit)
    @limit = limit
    ticker.add_observer(self, :notify) # default callback is :update
  end
end

### An observer for price below limit.
class WarnLow < Warner
  # callback for observer
  def notify(time, price)
    print "--- #{time}: Price below #{@limit}: #{price}\n" if price < @limit
  end
end

### An observer for price above limit.
class WarnHigh < Warner
  # callback for observer
  def notify(time, price)
    print "+++ #{time}: Price above #{@limit}: #{price}\n" if price > @limit
  end
end

ticker = Ticker.new('MSFT')
WarnLow.new(ticker, 80)
WarnHigh.new(ticker, 120)
ticker.run
