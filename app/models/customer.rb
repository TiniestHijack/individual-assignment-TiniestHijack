class Customer < ApplicationRecord
    has_one :user
    has_many :payments
    has_many :purchases
    has_many :credit_cards
    validates :last_name, :first_name, presence: true
end
