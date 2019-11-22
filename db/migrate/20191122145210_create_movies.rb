class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :Title
      t.integer :Year
      t.string :Director
      t.integer :Duration
      t.decimal :Rating
      t.string :Content
      t.integer :NumReviews
      t.string :Country
      t.integer :Gross
      t.integer :Budget
      t.string :Actor1
      t.string :Actor2
      t.string :Actor3
      t.string :Genres
      t.string :Keywords

      t.timestamps
    end
  end
end
