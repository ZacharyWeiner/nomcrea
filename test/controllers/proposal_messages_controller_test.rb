require 'test_helper'

class ProposalMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposal_message = proposal_messages(:one)
  end

  test "should get index" do
    get proposal_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_proposal_message_url
    assert_response :success
  end

  test "should create proposal_message" do
    assert_difference('ProposalMessage.count') do
      post proposal_messages_url, params: { proposal_message: { message: @proposal_message.message, proposal_id: @proposal_message.proposal_id, user_id: @proposal_message.user_id } }
    end

    assert_redirected_to proposal_message_url(ProposalMessage.last)
  end

  test "should show proposal_message" do
    get proposal_message_url(@proposal_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposal_message_url(@proposal_message)
    assert_response :success
  end

  test "should update proposal_message" do
    patch proposal_message_url(@proposal_message), params: { proposal_message: { message: @proposal_message.message, proposal_id: @proposal_message.proposal_id, user_id: @proposal_message.user_id } }
    assert_redirected_to proposal_message_url(@proposal_message)
  end

  test "should destroy proposal_message" do
    assert_difference('ProposalMessage.count', -1) do
      delete proposal_message_url(@proposal_message)
    end

    assert_redirected_to proposal_messages_url
  end
end
