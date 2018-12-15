class AddImgPathToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :img_path, :string
  end
end
