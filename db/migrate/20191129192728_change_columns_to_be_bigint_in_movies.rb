class ChangeColumnsToBeBigintInMovies < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :Gross, :bigint
    change_column :movies, :Budget, :bigint
  end
end
