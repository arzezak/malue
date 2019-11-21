require "pry"

RSpec.describe Malue::Search do
  let(:search) do
    Malue::Search.new("iPhone 7 Plus")
  end

  around(:each) do |example|
    VCR.insert_cassette("successful_query")
    example.run
    VCR.eject_cassette("successful_query")
  end

  describe "#average" do
    it "returns the average price for the queried product" do
      min, max = search.prices.minmax

      expect(search.average).to be > min
      expect(search.average).to be < max
    end
  end

  describe "#first" do
    it "returns the first item" do
      expect(search.first).to be_a(Malue::Item)
    end
  end

  describe "#prices" do
    it "returns each result's price" do
      search.prices.each do |price|
        expect(price).to be_an_instance_of(BigDecimal)
      end
    end
  end

  describe "#size" do
    it "returns the number of results" do
      expect(search.size).to be_positive
    end
  end

  describe "#successful?" do
    it "returns true if response was successful" do
      expect(search).to be_successful
    end
  end

  describe "#results" do
    it "returns an array of results for the given query" do
      results = search.send(:results)

      expect(results).to be_an(Array)
    end
  end
end
