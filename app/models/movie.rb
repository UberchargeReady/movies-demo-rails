class Movie < ApplicationRecord
	has_many :movie_genres
	has_many :genres, through: :movie_genres

	def genre_names
		arr = []
		genres.each do |g|
			arr << g.name
		end
		arr.join(', ')
	end

end
