RSpec.describe Malue::Item do
  describe "#price" do
    it "returns the price" do
      item = Malue::Item.new("price" => 1.99)

      expect(item.price).to eq(1.99)
    end
  end
end
