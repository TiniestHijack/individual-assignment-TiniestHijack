class Payment < ApplicationRecord
  belongs_to :credit_card
  belongs_to :customer
  belongs_to :purchase
  validates :amount, :credit_card_id, :customer_id, :purchase_id, presence: true

  def self.search(term, category)
    if term
        where("#{category} LIKE ?", "%#{term}%")
    else
        all
    end
  end
end
