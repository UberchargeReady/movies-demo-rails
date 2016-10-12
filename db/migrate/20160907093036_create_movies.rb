class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.datetime :released
      t.string :poster_url
      t.integer :runtime_in_mins
      t.string :mpaa_rating
      t.text :plot
      t.integer :year
      t.string :writer

      t.timestamps
    end
  end
end
