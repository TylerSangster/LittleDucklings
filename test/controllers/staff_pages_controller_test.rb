require "test_helper"

class StaffPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff_page = staff_pages(:one)
  end

  test "should get index" do
    get staff_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_page_url
    assert_response :success
  end

  test "should create staff_page" do
    assert_difference('StaffPage.count') do
      post staff_pages_url, params: { staff_page: { body: @staff_page.body, created_at: @staff_page.created_at, location: @staff_page.location, name: @staff_page.name, published_at: @staff_page.published_at, slug: @staff_page.slug, state: @staff_page.state, updaated_at: @staff_page.updaated_at } }
    end

    assert_redirected_to staff_page_url(StaffPage.last)
  end

  test "should show staff_page" do
    get staff_page_url(@staff_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_page_url(@staff_page)
    assert_response :success
  end

  test "should update staff_page" do
    patch staff_page_url(@staff_page), params: { staff_page: { body: @staff_page.body, created_at: @staff_page.created_at, location: @staff_page.location, name: @staff_page.name, published_at: @staff_page.published_at, slug: @staff_page.slug, state: @staff_page.state, updaated_at: @staff_page.updaated_at } }
    assert_redirected_to staff_page_url(@staff_page)
  end

  test "should destroy staff_page" do
    assert_difference('StaffPage.count', -1) do
      delete staff_page_url(@staff_page)
    end

    assert_redirected_to staff_pages_url
  end
end
