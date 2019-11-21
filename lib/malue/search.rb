require "net/http"
require "json"

module Malue
  class Search
    BASE_URL = "https://api.mercadolibre.com/sites/MLA".freeze

    attr_reader :query, :results

    def initialize(query)
      @query = query
      @results = fetch_results
    end

    def average
      Float(prices.inject(&:+) / prices.length)
    end

    def first
      results.first
    end

    def prices
      results.map(&:price)
    end

    def size
      results.size
    end

    def successful?
      response.code == "200"
    end

    private

    def body
      JSON.parse(response.body)
    end

    def response
      @response ||= Net::HTTP.get_response(uri)
    end

    def fetch_results
      body.fetch("results").map(&Item.method(:new))
    end

    def uri
      URI.parse("#{BASE_URL}/search?q=#{query}")
    end
  end
end
