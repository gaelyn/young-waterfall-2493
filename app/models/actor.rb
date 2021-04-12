class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.order_by_age_if_working
    where(currently_working: TRUE).order(age: :desc).distinct
  end
end
