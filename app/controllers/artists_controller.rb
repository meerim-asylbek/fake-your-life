class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show] 
  def index
    @artists = Artist.all
  end

  def show
  end

  private
 
  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :category, :address, :description, :photo, :price, :age)
  end
end
