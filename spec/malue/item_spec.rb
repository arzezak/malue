RSpec.describe Malue::Item do
  let(:item) do
    Malue::Item.new("price" => 1.99)
  end

  describe "#price" do
    it "returns the price" do
      expect(item.price).to eq(1.99)
    end
  end
end
