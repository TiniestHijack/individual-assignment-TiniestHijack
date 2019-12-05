class Payment < ApplicationRecord
  belongs_to :credit_card
  belongs_to :customer
  belongs_to :purchase
  validates :amount, presence: true
end
