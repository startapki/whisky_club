class RatingsController < ApplicationController
  before_action :set_rating, only: [:update]

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      track_rating('Add')
      render :success
    else
      render :failure
    end
  end

  def update
    if @rating.update(rating_params)
      track_rating('Update')
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

  def track_rating(verb = 'Add')
    opts = { 'Item ID' => @rating.item_id, 'Meeting ID' => @rating.item.try(:meeting_id) }
    mixpanel.track("#{verb} Comment", opts) unless @rating.comment.blank?
    mixpanel.track("#{verb} Rating", opts.merge('Value' => @rating.value)) if @rating.value.to_i > 0
  end
end
