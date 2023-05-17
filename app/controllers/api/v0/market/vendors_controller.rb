class Api::V0::Market::VendorsController < ApplicationController
  def index
    vendors = Market.find(params[:market_id]).vendors
    render json: VendorSerializer.new(vendors).serializable_hash.to_json
  end
end
