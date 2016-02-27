class HomeController < ApplicationController
  def index
    @meeting = Meeting.last

    render :empty if @meeting.blank?
  end
end
