class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
  has_one :payment
  validates :ownership, presence: true
end
