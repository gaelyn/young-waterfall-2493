# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
@movie_1 = @studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
@movie_2 = @studio_1.movies.create!(title: 'A New Hope', creation_year: 1977, genre: 'SciFi')
@actor_1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: true)
@actor_2 = Actor.create!(name: 'Mark Hamill', age: 70, currently_working: true)
@actor_3 = Actor.create!(name: 'Daisy Ridley', age: 29, currently_working: true)
@actor_4 = Actor.create!(name: 'Carrie Fischer', age: 58, currently_working: false)
MovieActor.create!(movie: @movie_1, actor: @actor_1)
MovieActor.create!(movie: @movie_2, actor: @actor_1)
MovieActor.create!(movie: @movie_2, actor: @actor_2)
