class RatingsController < ApplicationController
  before_action :set_rating, only: [:update]

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      render :success
    else
      render :failure
    end
  end

  def update
    if @rating.update(rating_params)
      render :success
    else
      render :failure
    end
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params
      .require(:rating)
      .permit(:value, :comment, :item_id)
      .merge(user: current_user)
  end
end
