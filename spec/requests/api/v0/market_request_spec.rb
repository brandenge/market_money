require 'rails_helper'

RSpec.describe 'Markets API', type: :request do
  it 'sends a list of markets' do
    market_object = create(:market)

    get "/api/v0/markets/#{market_object.id}"

    expect(response).to be_successful

    market = JSON.parse(response.body, symbolize_names: true)

    expect(market).to have_key(:data)
    expect(market[:data]).to be_an(Hash)

    expect(market[:data]).to have_key(:id)
    expect(market[:data][:id]).to be_an(Integer)

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
