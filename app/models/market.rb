class Market < ApplicationRecord
  has_many :market_vendors, dependent: :destroy
  has_many :vendors, -> { distinct }, through: :market_vendors

  validates_presence_of :name,
                        :state

  def vendor_count
    vendors.count
  end

  def vendors_by_market_vendor_id
    Vendor.joins(:market_vendors).where('market_vendors.market_id': id).order('market_vendors.id')
  end
end
