class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.archive
  end
end
