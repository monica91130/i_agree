require 'test_helper'

class CategoryFollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get category_follows_create_url
    assert_response :success
  end

  test "should get destroy" do
    get category_follows_destroy_url
    assert_response :success
  end

end
