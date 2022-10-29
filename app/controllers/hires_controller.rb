class HiresController < ApplicationController
  before_action :set_artist, only: [:new, :create]
  before_action :set_user, only: [:new, :create]

  def new
    @hire = Hire.new
  end

  def create
    @hire = Hire.new
    @hire.artist = @artist
    @hire.user = @user
    @hire.save
    redirect_to root_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def hire_params
    params.require(:hire).permit(:start_date, :end_date, :total_price, :artist)
  end
end
