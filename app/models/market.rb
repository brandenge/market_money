class Market < ApplicationRecord
  has_many :market_vendors, dependent: :destroy
  has_many :vendors, -> { distinct }, through: :market_vendors

  validates_presence_of :name,
                        :state

  def self.search_params_are_valid?(name, city, state)
    (state.nil? || state.nil? && name.nil?) ? false : true
  end

  def self.search(name, city, state)
    where("name ILIKE '%#{name}%'").where("city ILIKE '%#{city}%'").where("state ILIKE '%#{state}%'")
  end

  def vendor_count
    vendors.count
  end

  def vendors_by_market_vendor_id
    Vendor.joins(:market_vendors).where('market_vendors.market_id': id).order('market_vendors.id')
  end
end
