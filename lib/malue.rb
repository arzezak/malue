require "malue/error"
require "malue/item"
require "malue/search"
require "malue/version"

module Malue
  def self.average(query)
    Search.new(query).average
  end
end
