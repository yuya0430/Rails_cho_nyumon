require 'test_helper'

class BoardMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board__message = board__messages(:one)
  end

  test "should get index" do
    get board__messages_url
    assert_response :success
  end

  test "should get new" do
    get new_board__message_url
    assert_response :success
  end

  test "should create board__message" do
    assert_difference('BoardMessage.count') do
      post board__messages_url, params: { board__message: { board_user_id: @board__message.board_user_id, content: @board__message.content } }
    end

    assert_redirected_to board__message_url(BoardMessage.last)
  end

  test "should show board__message" do
    get board__message_url(@board__message)
    assert_response :success
  end

  test "should get edit" do
    get edit_board__message_url(@board__message)
    assert_response :success
  end

  test "should update board__message" do
    patch board__message_url(@board__message), params: { board__message: { board_user_id: @board__message.board_user_id, content: @board__message.content } }
    assert_redirected_to board__message_url(@board__message)
  end

  test "should destroy board__message" do
    assert_difference('BoardMessage.count', -1) do
      delete board__message_url(@board__message)
    end

    assert_redirected_to board__messages_url
  end
end
