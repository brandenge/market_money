class Api::V0::MarketsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    markets = Market.all
    render json: MarketSerializer.new(markets).format_markets
  end

  def show
    market = Market.find(params[:id])
    render json: MarketSerializer.new(market).format_market
  end

  private

  def not_found(exception)
    render json: ErrorSerializer.new(exception).format_not_found, status: :not_found
  end
end
