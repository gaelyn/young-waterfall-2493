class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def add_actor
    @movie = Movie.find(params[:id])
    @actor = Actor.find_by_name(params["name"])
    MovieActor.create!(movie: @movie, actor: @actor)
    redirect_to "/movies/#{@movie.id}"
  end
end
