require 'rails_helper'

RSpec.describe 'Create Vendor API', type: :request do
  context 'has all required attributes' do
    it 'can create a new vendor' do
      vendor_params = {
        name: 'Widget Market Vendor',
        description: 'This vendor sells widgets',
        contact_name: 'Joe Smith',
        contact_phone: '123-456-7890',
        credit_accepted: false
      }

      post api_v0_vendor_path, headers: JSON_HEADER, params: JSON.generate(vendor: vendor_params)

      created_vendor = Vendor.last

      expect(response).to be_successful
      expect(response.status).to eq(201)

      vendor = JSON.parse(response.body, symbolize_names: true)

      expect(vendor).to be_a(Hash)
      expect(vendor).to have_key(:data)
      expect(vendor[:data]).to be_a(Hash)

      expect(vendor[:data]).to have_key(:id)
      expect(vendor[:data][:id]).to be_a(String)

      expect(vendor[:data]).to have_key(:type)
      expect(vendor[:data][:type]).to eq('vendor')

      expect(vendor[:data]).to have_key(:attributes)
      expect(vendor[:data][:attributes]).to be_a(Hash)

      expect(vendor[:data][:attributes]).to have_key(:name)
      expect(vendor[:data][:attributes][:name]).to be_a(String)

      expect(vendor[:data][:attributes]).to have_key(:description)
      expect(vendor[:data][:attributes][:description]).to be_a(String)

      expect(vendor[:data][:attributes]).to have_key(:contact_name)
      expect(vendor[:data][:attributes][:contact_name]).to be_a(String)

      expect(vendor[:data][:attributes]).to have_key(:contact_phone)
      expect(vendor[:data][:attributes][:contact_phone]).to be_a(String)

      expect(vendor[:data][:attributes]).to have_key(:credit_accepted)
      expect(vendor[:data][:attributes][:credit_accepted]).to be_in([true, false])
    end
  end

  context 'has missing attributes' do
    it 'sends error details' do
      vendor_params = {
        name: 'Widget Market Vendor',
        description: 'This vendor sells widgets',
        credit_accepted: false
      }

      post api_v0_vendor_path, headers: JSON_HEADER, params: JSON.generate(vendor: vendor_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:errors)
      expect(error_response[:errors]).to be_an(Array)

      expect(error_response[:errors][0]).to have_key(:detail)
      expect(error_response[:errors][0][:detail]).to be_a(String)
    end
  end
end
