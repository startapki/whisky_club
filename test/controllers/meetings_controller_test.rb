require 'test_helper'

class MeetingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @past_meeting = meetings(:past)
  end

  test 'should get index' do
    get meetings_url
    assert_response :success
    assert_select 'h1', @past_meeting.title
  end
end
