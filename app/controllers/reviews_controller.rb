class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    # TODO call the list, add the list id to the new review, make a if statement for the save
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    # redirect_to artist_path(@review.list)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
