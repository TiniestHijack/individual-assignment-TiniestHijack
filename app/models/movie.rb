class Movie < ApplicationRecord
    validates :Title, :Year, :Director, :Duration, :Rating, :Content, :NumReviews, :Country, :Gross, :Budget, :Actor1, :Actor2, :Actor3, :Genres, :Keywords, presence: true
end
