require 'test_helper'

class RouterTest < ActionDispatch::IntegrationTest
  test 'routes' do
    assert_routing '/', controller: 'static_pages', action: 'home'
    assert_routing '/members_only', controller: 'static_pages', action: 'members_only'
    assert_routing '/admins_only', controller: 'static_pages', action: 'admins_only'
  end
end