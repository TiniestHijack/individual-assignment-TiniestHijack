class MoviesController < ApplicationController
  skip_before_action :logged_in?, only: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound,with: :redirect_if_not_found

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.search(params[:term], params[:category])
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    #require 'wikipedia'
    #@page = Wikipedia.find(@movie.Title)
    #@image = @page.image_urls[3]
    @plot = Movie.get_plot_by_title(@movie.Title)
    @image = Movie.get_image_by_title(@movie.Title)
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:Title, :Year, :Director, :Duration, :Rating, :Content, :NumReviews, :Country, :Gross, :Budget, :Actor1, :Actor2, :Actor3, :Genres, :Keywords, :term, :category)
    end
end
