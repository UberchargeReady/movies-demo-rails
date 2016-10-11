class CreateMovieGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_genres do |t|
    	t.integer :movie_id
    	t.integer :genre_id

      t.timestamps
    end
    add_index :movie_genres, :movie_id
    add_index :movie_genres, :genre_id
    add_index :movie_genres, [:movie_id, :genre_id], unique: true
  end
end
