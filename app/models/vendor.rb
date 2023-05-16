class Vendor < ApplicationRecord
  has_many :market_vendors, dependent: :destroy
  has_many :markets, -> { distinct }, through: :market_vendors

  validates :name, presence: true
  validates :description, presence: true
  validates :contact_name, presence: true
  validates :contact_phone, presence: true
  validates :credit_accepted, presence: true
end
