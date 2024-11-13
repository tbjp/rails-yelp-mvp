class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create

    p @restaurant = Restaurant.find(params[:restaurant_id])
    p @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render restaurant_path(@restaurant), status: :unprocessable_entity # 422
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
