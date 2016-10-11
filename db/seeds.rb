# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sample_user_count = 200

sample_movie_count = 2000

netflix_factor = 0.8

amazon_factor = 0.7

hulu_factor = 0.2

google_play_factor = 0.4

youtube_factor = 0.3

vudu_factor = 0.6

cinema_now_factor = 0.5

itunes_factor = 0.6

hbo_factor = 0.1

genres = ['action', 'horror', 'mystery', 'sci-fi', 'medieval', 'cyberpunk', 'steampunk', 'documentary', 'comedy', 'thriller', 'romance', 
          'war', 'music', 'crime', 'adventure', 'western', 'animation', 'history', 'fantasy', 'musical']

# admin user
User.create!(name:  "Admin User",
             email: "admin@moviesapp.com",
             password:              "foobar",
             password_confirmation: "foobar", 
             is_admin: true,
             is_activated: true,
             activated_at: Time.zone.now)

# users
sample_user_count.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               is_activated: true,
               activated_at: Time.zone.now)
end

# genres
genres.each do |g|
  Genre.create!(name: g)
end

# movies
sample_movie_count.times do |n|
  title = Faker::Book.title
  director = Faker::Name.name
  writer = Faker::Book.author
  arr = []
  (rand(4)+1).times { |n| arr[n] = Faker::Name.name }
  actors = arr.join(', ')
  released = rand(10.years).seconds.ago
  year = released.year
  plot = Faker::Lorem.sentence
  runtime_in_mins = rand(60..200)
  poster_url = 'http://easymovieposter.com/Design/_images/emp_vignettes/192x296_EMPT_Blank_W.jpg'
  mpaa_rating = %w(G PG PG-13 R NC-17).sample
  on_netflix = rand < netflix_factor
  on_amazon = rand < amazon_factor
  on_hulu = rand < hulu_factor
  on_google_play = rand < google_play_factor
  on_youtube = rand < youtube_factor
  on_vudu = rand < vudu_factor
  on_cinema_now = rand < cinema_now_factor
  on_itunes = rand < itunes_factor
  on_hbo = rand < hbo_factor
  movie = Movie.create!(title: title,
  			   director: director,
  			   writer: writer,
  			   actors: actors,
  			   released: released,
  			   year: year,
  			   plot: plot,
  			   runtime_in_mins: runtime_in_mins,
  			   poster_url: poster_url,
  			   mpaa_rating: mpaa_rating,
           on_netflix: on_netflix,
           on_amazon: on_amazon,
           on_google_play: on_google_play,
           on_hulu: on_hulu,
           on_youtube: on_youtube,
           on_vudu: on_vudu,
           on_cinema_now: on_cinema_now,
           on_itunes: on_itunes,
           on_hbo: on_hbo)
  #movie genres
  genre_count = rand(2) + 1
  genres = Genre.all.shuffle[0...genre_count]
  genre_count.times do |n|
    MovieGenre.create!(movie_id: movie.id, genre_id: genres[n].id)
  end
end
