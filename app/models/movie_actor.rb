class MovieActor < ApplicationRecord
	belongs_to :movie
	belongs_to :industry_person
end
