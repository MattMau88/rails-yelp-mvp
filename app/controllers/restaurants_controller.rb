class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  # => In this MVP, a visitor cannot update / delete any restaurant or review
  # def update
  #   if @restaurant.update(restaurant_params)
  #     redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @restaurant.destroy
  #   redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.'
  # end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :phone_number, :address, :category)
  end
end
