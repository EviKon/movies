class MoviesController < ApplicationController
  before_action :get_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movie = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      flash[:success] = 'Movie was created successfully'

      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def update
    if @movie.update(movie_params)
      flash[:success] = 'Movie was updated successfully'

      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def destroy
    Movie.find(params[:id]).destroy

    flash[:success] = "Movie deleted successfully!"
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :description)
  end

  def get_movie
    @movie = Movie.find(params[:id])
  end
end
