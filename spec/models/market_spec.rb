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
  end
end
