class AddTitleAndDateAndGenreToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :title, :string
    add_column :movies, :release_date, :string
    add_column :movies, :genre, :string
  end
end
