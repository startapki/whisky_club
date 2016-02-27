class HomeController < ApplicationController
  def index
    @meeting = Meeting.last
  end
end
