require "application_system_test_case"

class UserActionsTest < ApplicationSystemTestCase
  setup do
    @user_action = user_actions(:one)
  end

  test "visiting the index" do
    visit user_actions_url
    assert_selector "h1", text: "User Actions"
  end

  test "creating a User action" do
    visit user_actions_url
    click_on "New User Action"

    click_on "Create User action"

    assert_text "User action was successfully created"
    click_on "Back"
  end

  test "updating a User action" do
    visit user_actions_url
    click_on "Edit", match: :first

    click_on "Update User action"

    assert_text "User action was successfully updated"
    click_on "Back"
  end

  test "destroying a User action" do
    visit user_actions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User action was successfully destroyed"
  end
end
