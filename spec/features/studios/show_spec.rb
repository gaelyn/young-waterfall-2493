require 'rails_helper'

RSpec.describe "studio show", type: :feature do
  before :each do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @movie_1 = @studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @movie_2 = @studio_1.movies.create!(title: 'A New Hope', creation_year: 1977, genre: 'SciFi')
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
end
