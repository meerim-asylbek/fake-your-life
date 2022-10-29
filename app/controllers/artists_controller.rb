class ArtistsController < ApplicationController

  before_action :set_artist, only: %i[show create edit update]
  before_action :set_user, only: [:new, :show, :create, :edit, :update, :customer_artist?]

  # def customer_artist?
  #   @artist = Artist.where(current_user)
  #   @customer == @artist
  # end

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = artist.new(artist_params)
    @artist.user = @user
    if @artist.save
      redirect_to user_artist_path(@artist.user, @artist)
    else
      render :new, status: :unprocessable_entity
    end
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

  def edit
  end

  def update
    @artist.user = @user
    @artist.update(artist_params)
    redirect_to user_artist_path(@artist.user, @artist)
  end

  private

  def set_user
    @user = current_user
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :category, :address, :description, :photos, :price, :age)
  end

end
