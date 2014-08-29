require 'test_helper'

class HomepageControllerTest < ActionController::TestCase
  test "should get show_topics" do
    get :show_topics
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
