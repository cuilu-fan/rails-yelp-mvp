class RestaurantsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update]
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(set_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: 422
    end
  end

  def show
    @review = Review.new
  end

  def edit
  end

  def update
    @restaurant.update(set_params)
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def find_id
    @restaurant = Restaurant.find(params[:id])
  end

end
