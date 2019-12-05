class Movie < ApplicationRecord
    has_many :purchases
    validates :Title, :Year, :Director, :Duration, :Rating, :Content, :NumReviews, :Country, :Gross, :Budget, :Actor1, :Actor2, :Actor3, :Genres, :Keywords, presence: true

    def self.search(term)
        if term 
            where('"Title" LIKE ?', "%#{term}%")
        else
            all
        end
    end
end
