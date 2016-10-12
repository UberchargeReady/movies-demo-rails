class Movie < ApplicationRecord
	has_many :movie_genres
	has_many :genres, through: :movie_genres
	has_many :movie_actors
	has_many :movie_directors
	has_many :industry_people, through: :movie_actors
	has_many :industry_people, through: :movie_directors

	def genre_names
		arr = []
		genres.each do |g|
			arr << g.name.capitalize 
		end
		arr.join(', ')
	end

	def director_names
		arr = []
		movie_directors.each do |d|
			arr << IndustryPerson.find(d.industry_person_id).name
		end
		arr.join(', ')
	end

	def starring_actors_names
		arr = []
		starring = movie_actors.where(is_starring: true)
		starring.each do |a|
			arr << IndustryPerson.find(a.industry_person_id).name
		end
		arr.join(', ')
	end

end
