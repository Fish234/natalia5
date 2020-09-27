require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get home page" do
    get root_url
    assert_response :success
  end

  test "should redirect user if not signed in" do
  skip
    get static_pages_members_only_url
    assert_redirected_to new_user_session_path
  end

  test "should get members only page after sign in" do
  skip
    sign_in users(:one)
    get static_pages_members_only_url
    assert_response :success
  end

  test "should get admin_only" do
  skip
    sign_in users(:one)
    get static_pages_admin_only_url
    assert_redirected_to root_path
  end
end
