class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show create edit update]
  before_action :set_user, only: [:new, :show, :create, :edit, :update, :customer_artist?]

  # def customer_artist?
  #   @artist = Artist.where(current_user)
  #   @customer == @artist
  # end

  def index
    @customer = Customer.find_by(user_id: current_user.id)
    if params[:query].present? && !params[:query].empty?
      @query = params[:query]
      @artists = Artist.where("name LIKE ?", "%#{params[:query]}%")
    elsif index_params
      @filter = params[:filter]
      @artists = Artist.where("category LIKE ?", "%#{params[:filter]}%")
    else
      @artists = Artist.all
    end
  end

  #def create
    #@artist = artist.new(artist_params)
    #@artist.user = @user
    #if @artist.save
      #redirect_to user_artist_path(@artist.user, @artist)
    #else
      #render :new, status: :unprocessable_entity
    #end
  #end

  def show
    @hire = Hire.new()
    @hire_add = HireAdd.new()
    @review = Review.new()
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

  #def update
    #@artist.user = @user
    #@artist.update(artist_params)
    #redirect_to user_artist_path(@artist.user, @artist)
  #end

  private

  def set_user
    @user = current_user
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :category, :address, :description, :price, :age, photos: [])
  end

  def index_params
    params.permit(:filter, :query)
  end

end
