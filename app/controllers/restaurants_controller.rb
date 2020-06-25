class RestaurantsController < ApplicationController
before_action :get_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(strong_params_restaurant)
    @restaurant.save
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end


  private

  def get_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def strong_params_restaurant
    params.require(:restaurant).permit(:name, :rating, :address, :phone_number, :category)
  end
end
