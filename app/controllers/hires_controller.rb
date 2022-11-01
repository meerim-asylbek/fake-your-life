class HiresController < ApplicationController
  before_action :set_artist, only: [:new, :create]
  before_action :set_user, only: [:new, :create]

  def new
    @hire = Hire.new
  end

  def create
    @hire_add = HireAdd.new()
    @hire = Hire.new(hire_params)
    @customer = Customer.find_by(user_id: current_user)
    @artist = Artist.find(params[:artist_id])
    @hire.artist_id = @artist.id
    @hire.customer_id = @customer.id
    if @hire.save
      redirect_to root_path
    else
      @hire = Hire.new
      render 'artists/show', status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def hire_params
    params.require(:hire).permit(:start_date, :end_date, :total_price, :artist_id, :customer_id)
  end
end
