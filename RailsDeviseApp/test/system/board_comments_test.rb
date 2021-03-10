require "application_system_test_case"

class BoardCommentsTest < ApplicationSystemTestCase
  setup do
    @board_comment = board_comments(:one)
  end

  test "visiting the index" do
    visit board_comments_url
    assert_selector "h1", text: "Board Comments"
  end

  test "creating a Board comment" do
    visit board_comments_url
    click_on "New Board Comment"

    fill_in "Board user", with: @board_comment.board_user_id
    fill_in "Content", with: @board_comment.content
    click_on "Create Board comment"

    assert_text "Board comment was successfully created"
    click_on "Back"
  end

  test "updating a Board comment" do
    visit board_comments_url
    click_on "Edit", match: :first

    fill_in "Board user", with: @board_comment.board_user_id
    fill_in "Content", with: @board_comment.content
    click_on "Update Board comment"

    assert_text "Board comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Board comment" do
    visit board_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Board comment was successfully destroyed"
  end
end
