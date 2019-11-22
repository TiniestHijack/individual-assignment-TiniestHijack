json.extract! movie, :id, :Title, :Year, :Director, :Duration, :Rating, :Content, :NumReviews, :Country, :Gross, :Budget, :Actor1, :Actor2, :Actor3, :Genres, :Keywords, :created_at, :updated_at
json.url movie_url(movie, format: :json)
