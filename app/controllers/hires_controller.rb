class HiresController < ApplicationController

  def new
    @hire = Hire.new
  end

  def create
    @hire = Hire.new(hire_params)
    @customer = Customer.find_by(user_id: current_user.id)
    @artist = Artist.find(params[:artist_id])
    @hire.artist_id = @artist.id
    @hire.customer_id = @customer.id
    if @hire.save
      redirect_to artist_path(@artist)
    else
      @hire = Hire.new
      render 'artists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @hire = Hire.find(params[:id])
    @hire.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def hire_params
    params.require(:hire).permit(:start_date, :end_date, :total_price, :artist_id, :customer_id)
  end
end
