class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show destroy edit update] 

  def index
    @artists = Artist.all
  end

  def show
    @hire = Hire.new(artist: @artist)
    @review = Review.new(artist: @artist)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path, status: :see_other
  end

  private
 
  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :category, :address, :description, :photo, :price, :age)
  end

end
