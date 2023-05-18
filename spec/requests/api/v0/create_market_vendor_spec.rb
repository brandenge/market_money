require 'rails_helper'

RSpec.describe 'Create Market Vendor API' do
  context 'successfully create a new market vendor' do
    it 'can add a vendor to a market' do
      market = create(:market)
      vendor = create(:vendor)

      market_vendor_params = {
        market_id: market.id,
        vendor_id: vendor.id
      }

      expect(MarketVendor.count).to eq(0)
      expect{ post api_v0_market_vendors_path(market), headers: JSON_HEADER, params: JSON.generate(market_vendor: market_vendor_params) }
      expect(MarketVendor.count).to eq(1)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      created_market_vendor = MarketVendor.last
      
      expect(created_market_vendor.market_id).to eq(market.id)
      expect(created_market_vendor.vendor_id).to eq(vendor.id)
    end
  end
end
