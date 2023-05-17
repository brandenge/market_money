class MarketSerializer
  def format_markets(markets)
    {
      data: markets.map do |market|
        market_hash(market)
      end
    }
  end

  def format_market(market)
    {
      data: market_hash(market)
    }
  end

  private

  def market_hash(market)
    {
      id: market.id,
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
