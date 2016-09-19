module StaticPagesHelper

  def random_movie
    Movie.order("RANDOM()").first
  end

end
