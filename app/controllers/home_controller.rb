class HomeController < ApplicationController
  def index
    @meeting = Meeting.last

    mixpanel.track('View Current Meeting', 'Meeting ID' => @meeting.id)

    render :empty if @meeting.blank?
  end
end
