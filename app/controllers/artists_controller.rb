class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show create edit update]

  def index
    @customer = Customer.find_by(user_id: current_user.id)
    if params[:query].present? && !params[:query].empty?
      @query = params[:query]
      @artists = Artist.where("name LIKE ?", "%#{params[:query]}%")
      set_markers(@artists)
    elsif params[:all].present? && !params[:all].empty?
      @artists = Artist.all
      set_markers(@artists)
    elsif params[:filter].present? && !params[:filter].empty?
      @filter = params[:filter]
      @artists = Artist.where("category LIKE ?", "%#{params[:filter]}%")
      set_markers(@artists)
    else
      @artists = Artist.all
      set_markers(@artists)
    end
    @markers = @artists.geocoded.map do |artist|
      {
        lat: artist.latitude,
        lng: artist.longitude,
        info_window: render_to_string(partial: "info_window", locals: {artist: artist})
      }
    end
  end

  def show
    @customer = Customer.find_by(user_id: current_user.id)
    @review = Review.new()
    if Hire.find_by(customer_id: @customer.id, artist_id: @artist.id) 
      @hire = Hire.find_by(customer_id: @customer.id, artist_id: @artist.id) 
    else
      @hire = Hire.new()
    end
    @markers = [{
      lat: @artist.latitude,
      lng: @artist.longitude
      }]
  end

  def dashboard
    @artist = Artist.find_by(user_id: current_user)
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

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :category, :address, :description, :price, :age, photos: [])
  end

  def index_params
    params.permit(:filter, :query)
  end

  def set_markers(artists)
    @markers = artists.geocoded.map do |artist|
      {
        lat: artist.latitude,
        lng: artist.longitude
      }
    end
  end

end
