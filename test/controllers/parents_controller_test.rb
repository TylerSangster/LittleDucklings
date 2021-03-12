require "test_helper"

class ParentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parent = parents(:one)
  end

  test "should get index" do
    get parents_url
    assert_response :success
  end

  test "should get new" do
    get new_parent_url
    assert_response :success
  end

  test "should create parent" do
    assert_difference('Parent.count') do
      post parents_url, params: { parent: { first_name: @parent.first_name, last_name: @parent.last_name, notes: @parent.notes, phone_primary: @parent.phone_primary, phone_secondary: @parent.phone_secondary, postal: @parent.postal, primary_contract: @parent.primary_contract, province: @parent.province, street: @parent.street } }
    end

    assert_redirected_to parent_url(Parent.last)
  end

  test "should show parent" do
    get parent_url(@parent)
    assert_response :success
  end

  test "should get edit" do
    get edit_parent_url(@parent)
    assert_response :success
  end

  test "should update parent" do
    patch parent_url(@parent), params: { parent: { first_name: @parent.first_name, last_name: @parent.last_name, notes: @parent.notes, phone_primary: @parent.phone_primary, phone_secondary: @parent.phone_secondary, postal: @parent.postal, primary_contract: @parent.primary_contract, province: @parent.province, street: @parent.street } }
    assert_redirected_to parent_url(@parent)
  end

  test "should destroy parent" do
    assert_difference('Parent.count', -1) do
      delete parent_url(@parent)
    end

    assert_redirected_to parents_url
  end
end
