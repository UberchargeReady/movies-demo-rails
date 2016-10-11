class AddStreamingServicesToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :on_netflix, :boolean
    add_column :movies, :on_amazon, :boolean
    add_column :movies, :on_hulu, :boolean
    add_column :movies, :on_google_play, :boolean
    add_column :movies, :on_itunes, :boolean
    add_column :movies, :on_hbo, :boolean
    add_column :movies, :on_youtube, :boolean
    add_column :movies, :on_vudu, :boolean
    add_column :movies, :on_cinema_now, :boolean
  end
end
