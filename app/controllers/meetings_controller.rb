class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.archive
    mixpanel.track('View Archive')
  end
end
