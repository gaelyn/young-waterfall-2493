require 'rails_helper'

RSpec.describe "studio show", type: :feature do
  before :each do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
  end
  it "can see studio's name and location" do
    visit "/studios/#{@studio_1.id}"
    save_and_open_page
    expect(page).to have_content(@studio_1.name)
    expect(page).to have_content(@studio_1.location)

  end

  it "can see titles of all it's movies" do
  end
end

# Story 1
# Studio Show
#
# As a user,
# When I visit a studio show page
# I see the studio's name and location
# And I see the titles of all of its movies
