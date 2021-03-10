require "application_system_test_case"

class BoardMessagesTest < ApplicationSystemTestCase
  setup do
    @board__message = board__messages(:one)
  end

  test "visiting the index" do
    visit board__messages_url
    assert_selector "h1", text: "Board Messages"
  end

  test "creating a Board  message" do
    visit board__messages_url
    click_on "New Board Message"

    fill_in "Board user", with: @board__message.board_user_id
    fill_in "Content", with: @board__message.content
    click_on "Create Board  message"

    assert_text "Board  message was successfully created"
    click_on "Back"
  end

  test "updating a Board  message" do
    visit board__messages_url
    click_on "Edit", match: :first

    fill_in "Board user", with: @board__message.board_user_id
    fill_in "Content", with: @board__message.content
    click_on "Update Board  message"

    assert_text "Board  message was successfully updated"
    click_on "Back"
  end

  test "destroying a Board  message" do
    visit board__messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Board  message was successfully destroyed"
  end
end
