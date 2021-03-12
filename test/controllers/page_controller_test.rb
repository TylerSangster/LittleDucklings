require "test_helper"

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get page_home_url
    assert_response :success
  end

  test "should get about" do
    get page_about_url
    assert_response :success
  end

  test "should get contact" do
    get page_contact_url
    assert_response :success
  end

  test "should get photos" do
    get page_photos_url
    assert_response :success
  end

  test "should get where" do
    get page_where_url
    assert_response :success
  end
end
