class CreateMovieActors < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_actors do |t|
    	t.integer :movie_id
    	t.integer :industry_person_id
      t.boolean :is_starring, default: false

      t.timestamps
    end
    add_index :movie_actors, :movie_id
    add_index :movie_actors, :industry_person_id
    add_index :movie_actors, [:movie_id, :industry_person_id], unique: true
  end
end
