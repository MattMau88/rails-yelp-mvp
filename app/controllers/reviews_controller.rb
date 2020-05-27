class ReviewsController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    # we need `restaurant_id` to associate review with corresponding restaurant
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  # => In this MVP, a visitor cannot update / delete any restaurant or review
  # def edit
  #   @review = Review.find(params[:id])
  #   @restaurant = @review.restaurant
  # end

  # def destroy
  #   @review = Review.find(params[:id])
  #   @review.destroy
  #   redirect_to restaurant_path(@review.restaurant)
  # end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
