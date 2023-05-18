require 'rails_helper'

RSpec.describe Market, type: :model do
  describe 'relationships' do
    it { should have_many(:market_vendors) }
    it { should have_many(:vendors).through(:market_vendors) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:state) }
  end

  describe 'instance methods' do
    describe '#vendor_count' do
      it 'returns the number of vendors for the market' do
        market = create(:market_with_vendors, vendor_count: 6)
        expect(market.vendor_count).to eq(6)
      end
    end

    describe '#vendors_by_market_vendor_id' do
      it 'returns the list of vendors for the market, ordered by their market_vendor id' do
        market = create(:market)
        vendor1 = create(:vendor)
        vendor2 = create(:vendor)
        vendor3 = create(:vendor)
        market_vendor1 = create(:market_vendor, market: market, vendor: vendor2)
        market_vendor2 = create(:market_vendor, market: market, vendor: vendor3)
        market_vendor3 = create(:market_vendor, market: market, vendor: vendor1)

        expect(market.vendors_by_market_vendor_id)
          .to eq([vendor2, vendor3, vendor1])
      end
    end
  end
end
