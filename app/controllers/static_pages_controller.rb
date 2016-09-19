class StaticPagesController < ApplicationController
  include StaticPagesHelper

  def home
    @movie = random_movie
  end
	
end
