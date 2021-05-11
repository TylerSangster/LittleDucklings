require "application_system_test_case"

class StaffPagesTest < ApplicationSystemTestCase
  setup do
    @staff_page = staff_pages(:one)
  end

  test "visiting the index" do
    visit staff_pages_url
    assert_selector "h1", text: "Staff Pages"
  end

  test "creating a Staff page" do
    visit staff_pages_url
    click_on "New Staff Page"

    fill_in "Body", with: @staff_page.body
    fill_in "Created at", with: @staff_page.created_at
    fill_in "Location", with: @staff_page.location
    fill_in "Name", with: @staff_page.name
    fill_in "Published at", with: @staff_page.published_at
    fill_in "Slug", with: @staff_page.slug
    fill_in "State", with: @staff_page.state
    fill_in "Updaated at", with: @staff_page.updaated_at
    click_on "Create Staff page"

    assert_text "Staff page was successfully created"
    click_on "Back"
  end

  test "updating a Staff page" do
    visit staff_pages_url
    click_on "Edit", match: :first

    fill_in "Body", with: @staff_page.body
    fill_in "Created at", with: @staff_page.created_at
    fill_in "Location", with: @staff_page.location
    fill_in "Name", with: @staff_page.name
    fill_in "Published at", with: @staff_page.published_at
    fill_in "Slug", with: @staff_page.slug
    fill_in "State", with: @staff_page.state
    fill_in "Updaated at", with: @staff_page.updaated_at
    click_on "Update Staff page"

    assert_text "Staff page was successfully updated"
    click_on "Back"
  end

  test "destroying a Staff page" do
    visit staff_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Staff page was successfully destroyed"
  end
end
