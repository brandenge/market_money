class MarketSerializer
  def initialize(market_data)
    @market_data = market_data
  end

  def format_markets
    {
      data: @market_data.map do |market|
        market_hash(market)
      end
    }
  end

  def format_market
    {
      data: market_hash(@market_data)
    }
  end

  private

  def market_hash(market)
    {
      id: market.id.to_s,
      type: 'market',
      attributes: {
        name: market.name,
        street: market.street,
        city: market.city,
        county: market.county,
        state: market.state,
        zip: market.zip,
        lat: market.lat,
        lon: market.lon,
        vendor_count: market.vendor_count
      }
    }
  end
end
