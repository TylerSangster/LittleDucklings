require "application_system_test_case"

class ContactSubmissionsTest < ApplicationSystemTestCase
  setup do
    @contact_submission = contact_submissions(:one)
  end

  test "visiting the index" do
    visit contact_submissions_url
    assert_selector "h1", text: "Contact Submissions"
  end

  test "creating a Contact submission" do
    visit contact_submissions_url
    click_on "New Contact Submission"

    click_on "Create Contact submission"

    assert_text "Contact submission was successfully created"
    click_on "Back"
  end

  test "updating a Contact submission" do
    visit contact_submissions_url
    click_on "Edit", match: :first

    click_on "Update Contact submission"

    assert_text "Contact submission was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact submission" do
    visit contact_submissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact submission was successfully destroyed"
  end
end
