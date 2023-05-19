class Api::V0::MarketVendorsController < ApplicationController
  def create
    if params[:market_vendor][:market_id].nil? ||
      params[:market_vendor][:vendor_id].nil?
      MarketVendor.create!(strong_params)
    end
    begin
      market_vendor = MarketVendor.create!(strong_params)
      render json: MarketVendorSerializer.new.successfully_added(market_vendor), status: 201
    rescue ActiveRecord::RecordInvalid => e
      render json: ErrorSerializer.new(e).serialize_json, status: 404
    end
  end

  private

  def strong_params
    params.require(:market_vendor).permit(:market_id, :vendor_id)
  end
end
