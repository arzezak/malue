require "pry"

RSpec.describe Malue::Search do
  let(:search) do
    Malue::Search.new("Example Product")
  end

  around(:each) do |example|
    VCR.use_cassette("query", &example)
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
      expect(search.prices).to all be_an_instance_of(BigDecimal)
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
end
