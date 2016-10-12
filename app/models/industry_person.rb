class IndustryPerson < ApplicationRecord
	has_many :movie_actors
	has_many :movie_directors
	has_many :movies, through: :movie_actors
	has_many :movies, through: :movie_directors
end
