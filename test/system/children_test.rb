require "application_system_test_case"

class ChildrenTest < ApplicationSystemTestCase
  setup do
    @child = children(:one)
  end

  test "visiting the index" do
    visit children_url
    assert_selector "h1", text: "Children"
  end

  test "creating a Child" do
    visit children_url
    click_on "New Child"

    fill_in "Allergies notes", with: @child.allergies_notes
    fill_in "Birthday", with: @child.birthday
    fill_in "First name", with: @child.first_name
    fill_in "Last name", with: @child.last_name
    fill_in "Location", with: @child.location
    fill_in "Notes", with: @child.notes
    fill_in "Parent", with: @child.parent_id
    fill_in "Sex", with: @child.sex
    click_on "Create Child"

    assert_text "Child was successfully created"
    click_on "Back"
  end

  test "updating a Child" do
    visit children_url
    click_on "Edit", match: :first

    fill_in "Allergies notes", with: @child.allergies_notes
    fill_in "Birthday", with: @child.birthday
    fill_in "First name", with: @child.first_name
    fill_in "Last name", with: @child.last_name
    fill_in "Location", with: @child.location
    fill_in "Notes", with: @child.notes
    fill_in "Parent", with: @child.parent_id
    fill_in "Sex", with: @child.sex
    click_on "Update Child"

    assert_text "Child was successfully updated"
    click_on "Back"
  end

  test "destroying a Child" do
    visit children_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Child was successfully destroyed"
  end
end
