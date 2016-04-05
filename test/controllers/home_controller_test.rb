require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @current_meeting = meetings(:current)
  end

  test 'should get index' do
    get root_url
    assert_response :success
    assert_select 'h1', @current_meeting.title
  end
end
