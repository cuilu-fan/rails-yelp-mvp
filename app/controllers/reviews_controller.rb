class ReviewsController < ApplicationController
  before_action :find_id, only: [:new, :create]
  def new
    @review = Review.new(review_params)
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def find_id
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
