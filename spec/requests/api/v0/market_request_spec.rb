require 'rails_helper'

RSpec.describe 'Markets API', type: :request do
  context 'using a valid market id' do
    it 'responds with a list of markets' do
      market_object = create(:market)

      get "/api/v0/markets/#{market_object.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      market = JSON.parse(response.body, symbolize_names: true)

      expect(market).to have_key(:data)
      expect(market[:data]).to be_an(Hash)

      expect(market[:data]).to have_key(:id)
      expect(market[:data][:id]).to be_a(String)

      expect(market[:data]).to have_key(:type)
      expect(market[:data][:type]).to eq('market')

      expect(market[:data]).to have_key(:attributes)
      expect(market[:data][:attributes]).to be_a(Hash)

      expect(market[:data][:attributes]).to have_key(:name)
      expect(market[:data][:attributes][:name]).to be_a(String)

      expect(market[:data][:attributes]).to have_key(:street)
      expect(market[:data][:attributes][:street]).to be_a(String)

      expect(market[:data][:attributes]).to have_key(:city)
      expect(market[:data][:attributes][:city]).to be_a(String)

      expect(market[:data][:attributes]).to have_key(:county)
      expect(market[:data][:attributes][:county]).to be_a(String)

      expect(market[:data][:attributes]).to have_key(:state)
      expect(market[:data][:attributes][:state]).to be_a(String)

      expect(market[:data][:attributes]).to have_key(:zip)
      expect(market[:data][:attributes][:zip]).to be_a(String)

      expect(market[:data][:attributes]).to have_key(:lat)
      expect(market[:data][:attributes][:lat]).to be_a(String)

      expect(market[:data][:attributes]).to have_key(:lon)
      expect(market[:data][:attributes][:lon]).to be_a(String)

      expect(market[:data][:attributes]).to have_key(:vendor_count)
      expect(market[:data][:attributes][:vendor_count]).to be_a(Integer)
    end
  end

  context 'using an invalid market id' do
    it 'responds with error details' do
      invalid_id = 123123123123
      get "/api/v0/markets/#{invalid_id}"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:errors)
      expect(error_response[:errors]).to be_an(Array)

      expect(error_response[:errors][0]).to have_key(:detail)
      expect(error_response[:errors][0][:detail]).to be_a(String)
    end
  end
end
