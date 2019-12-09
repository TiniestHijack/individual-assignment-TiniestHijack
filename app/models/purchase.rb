class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
  has_one :payment
  validates :ownership, :customer_id, :movie_id, presence: true

  def self.search(term, category)
    if term
        where("#{category} LIKE ?", "%#{term}%")
    else
        all
    end
  end
end
