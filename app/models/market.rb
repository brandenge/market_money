class Market < ApplicationRecord
  has_many :market_vendors, dependent: :destroy
  has_many :vendors, -> { distinct }, through: :market_vendors

  validates :name, presence: true
  validates :state, presence: true

  def vendor_count
    vendors.count
  end
end
