require 'csv'
namespace :movies do
  desc "pull data from the movie_metadata.csv"
  task seed_movies: :environment do

    #drop the old table to avoid problems in importing new values
    Movie.destroy_all

    p "tables emptied"

    CSV.foreach("lib/assets/movie_metadata.csv", :headers =>true) do |row, i|
      #to skip first line of csv file
      next if i == 0

      puts row.inspect #just so that we know the file is being read

      #create new model instance with all the data
      Movie.create!(
        Title: row[11],
        Year: row[23].to_i,
        Director: row[1],
        Duration: row[3].to_i,
        Rating: row[25].to_d,
        Content: row[21],
        NumReviews: row[2].to_i,
        Country: row[20],
        Gross: row[8].to_i,
        Budget: row[22].to_i,
        Actor1: row[10],
        Actor2: row[6],
        Actor3: row[14],
        Genres: row[9],
        Keywords: row[16]
      )
      end
  end

end
