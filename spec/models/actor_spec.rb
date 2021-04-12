require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it {should have_many :movie_actors}
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe 'class methods' do
    describe '#order_by_age_if_working' do
      it "can order actors by age oldest to youngest if currently_working is true" do
        @actor_1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: true)
        @actor_2 = Actor.create!(name: 'Mark Hamill', age: 70, currently_working: false)
        @actor_3 = Actor.create!(name: 'Daisy Ridley', age: 29, currently_working: true)

        expect(Actor.order_by_age_if_working).to eq([@actor_1, @actor_3])
      end
    end
  end

  describe 'instance methods' do
    describe '.find_by_name' do
      it "can find actor with given name" do
        @actor_1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: true)
        expect(Actor.find_by_name('Harrison Ford')).to eq(@actor_1)  
      end
    end
  end
end
