class Vendor < ApplicationRecord
  has_many :market_vendors, dependent: :destroy
  has_many :markets, -> { distinct }, through: :market_vendors

  validates_presence_of :name,
                        :description,
                        :contact_name,
                        :contact_phone

  validates :credit_accepted, exclusion: [nil]
  # validate :credit_accepted_is_boolean

  # def credit_accepted_is_boolean
  #     errors.add(:credit_accepted, :credit_accepted_not_boolean, "The credit_accepted attribute must be true or false") unless :credit_accepted in [true, false]
  # end
end
