class Api::V0::VendorsController < ApplicationController
  def show
    vendor = Vendor.find(params[:id])
    render json: VendorSerializer.new(vendor).serializable_hash.to_json
  end

  def create
    vendor = Vendor.create!(strong_params)
    render json: VendorSerializer.new(vendor).serializable_hash.to_json, status: :created
  end

  def update
    vendor = Vendor.find(params[:id])
    vendor.update!(strong_params)
    render json: VendorSerializer.new(vendor).serializable_hash.to_json, status: :ok
  end

  def destroy
    vendor = Vendor.find(params[:id])
    vendor.destroy!
    render body: nil, status: :no_content
  end

  private

  def strong_params
    params.require(:vendor).permit(:name, :description, :contact_name, :contact_phone, :credit_accepted)
  end
end
