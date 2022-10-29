class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @customer = Customer.find_by(user_id: current_user.id)
    @artist = Artist.find(params[:artist_id])
    @review.customer = @customer
    @review.artist = @artist
    if @review.save
      redirect_to artist_path(@artist)
    else
      render 'artists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    # redirect_to artist_path(@review.artist)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :customer_id, :artist_id)
  end

end
