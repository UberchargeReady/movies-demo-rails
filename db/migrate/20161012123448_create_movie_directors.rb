class CreateMovieDirectors < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_directors do |t|
    	t.integer :movie_id
    	t.integer :industry_person_id

      t.timestamps
    end
    add_index :movie_directors, :movie_id
    add_index :movie_directors, :industry_person_id
    add_index :movie_directors, [:movie_id, :industry_person_id], unique: true
  end
end
