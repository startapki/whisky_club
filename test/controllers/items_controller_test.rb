require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get items_url
    assert_response :success
  end
end
