require 'test_helper'

class TweetControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tweet_new_url
    assert_response :success
  end

  test "should get create" do
    get tweet_create_url
    assert_response :success
  end

end
