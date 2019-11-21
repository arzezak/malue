require "bigdecimal"

module Malue
  class Item
    attr_reader :price

    def initialize(data)
      @price = BigDecimal(data["price"], 8)
    end
  end
end
