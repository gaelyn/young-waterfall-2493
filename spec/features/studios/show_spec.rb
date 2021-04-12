require 'rails_helper'

RSpec.describe "studio show", type: :feature do
  before :each do
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
    MovieActor.create!(movie: @movie_2, actor: @actor_4)
  end

  it "can see studio's name and location" do
    visit "/studios/#{@studio_1.id}"

    expect(page).to have_content(@studio_1.name)
    expect(page).to have_content(@studio_1.location)

  end

  it "can see titles of all it's movies" do
    visit "/studios/#{@studio_1.id}"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_2.title)
  end

  it "can see list of unique actors that have acted in any of the studio's movies" do
    visit "/studios/#{@studio_1.id}"

    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_2.name)
    expect(page).not_to have_content(@actor_3.name)
  end

  it "can see actors listed in order from oldest to youngest" do
    visit "/studios/#{@studio_1.id}"
    save_and_open_page
    expect(@actor_1.name).to appear_before(@actor_2.name)
  end

  it "can see only actors that are currently working" do
    visit "/studios/#{@studio_1.id}"

    expect(page).not_to have_content(@actor_4.name)
  end
end
