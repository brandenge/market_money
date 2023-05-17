class Market < ApplicationRecord
  has_many :market_vendors, dependent: :destroy
  has_many :vendors, -> { distinct }, through: :market_vendors

  validates_presence_of :name,
                        :state

  def vendor_count
    vendors.count
  end
end
