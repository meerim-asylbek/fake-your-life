class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @customer = Customer.find_by(user_id: current_user)
    @artist = Artist.find(params[:artist_id])
    @review.artist_id = @artist.id
    @review.customer_id = @customer.id
    if @review.save
      redirect_to artist_path(@artist)
    else
      if Hire.find_by(customer_id: @customer, artist_id: @artist)
        @hire = Hire.find_by(customer_id: @customer, artist_id: @artist)
      else
        @hire = Hire.new(customer_id: @customer, artist_id: @artist)
      end
      @review = Review.new
      render 'artists/show', status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to artist_path(@review.artist)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :artist_id, :customer_id)
  end

end
