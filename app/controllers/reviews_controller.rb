class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    @review.save
    if @review.valid?
      redirect_to restaurant_path(@restaurant)
    else
      render :new

      # redirect_to new_restaurant_review_path(@restaurant)
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
