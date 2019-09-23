require "application_system_test_case"

class MeetingsListsTest < ApplicationSystemTestCase
  setup do
    @meetings_list = meetings_lists(:one)
  end

  test "visiting the index" do
    visit meetings_lists_url
    assert_selector "h1", text: "Meetings Lists"
  end

  test "creating a Meetings list" do
    visit meetings_lists_url
    click_on "New Meetings List"

    fill_in "Responsible", with: @meetings_list.responsible
    fill_in "title", with: @meetings_list.title
    click_on "Create Meetings list"

    assert_text "Meetings list was successfully created"
    click_on "Back"
  end

  test "updating a Meetings list" do
    visit meetings_lists_url
    click_on "Edit", match: :first

    fill_in "Responsible", with: @meetings_list.responsible
    fill_in "title", with: @meetings_list.title
    click_on "Update Meetings list"

    assert_text "Meetings list was successfully updated"
    click_on "Back"
  end

  test "destroying a Meetings list" do
    visit meetings_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meetings list was successfully destroyed"
  end
end
