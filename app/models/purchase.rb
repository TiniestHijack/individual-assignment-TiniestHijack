class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
  has_many :payment
  validates :ownership, presence: true
end
