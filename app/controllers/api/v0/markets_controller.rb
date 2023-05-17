class Api::V0::MarketsController < ApplicationController
  def index
    markets = Market.all
    render json: MarketSerializer.new.format_markets(markets)
  end

  def show
    market = Market.find(params[:id])
    render json: MarketSerializer.new.format_market(market)
  end
end
