# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin user
User.create!(name:  "Admin User",
             email: "admin@moviesapp.com",
             password:              "foobar",
             password_confirmation: "foobar", 
             is_admin: true,
             is_activated: true,
             activated_at: Time.zone.now)

# users
99.times do |n|
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

# movies
200.times do |n|
  title = Faker::Book.title
  director = Faker::Name.name
  writer = Faker::Book.author
  arr = []
  (1+rand(4)).times { |n| arr[n] = Faker::Name.name }
  actors = arr.join(', ')
  released = rand(10.years).seconds.ago
  year = released.year
  plot = Faker::Lorem.sentence
  runtime_in_mins = rand(60..200)
  poster_url = 'http://easymovieposter.com/Design/_images/emp_vignettes/192x296_EMPT_Blank_W.jpg'
  mpaa_rating = %w(G PG PG-13 R NC-17).sample
  Movie.create!(title: title,
			   director: director,
			   writer: writer,
			   actors: actors,
			   released: released,
			   year: year,
			   plot: plot,
			   runtime_in_mins: runtime_in_mins,
			   poster_url: poster_url,
			   mpaa_rating: mpaa_rating)
end