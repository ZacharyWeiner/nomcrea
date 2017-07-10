require 'test_helper'

class ProposalRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposal_request = proposal_requests(:one)
  end

  test "should get index" do
    get proposal_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_proposal_request_url
    assert_response :success
  end

  test "should create proposal_request" do
    assert_difference('ProposalRequest.count') do
      post proposal_requests_url, params: { proposal_request: { accepted: @proposal_request.accepted, accepted_on: @proposal_request.accepted_on, proposal_id: @proposal_request.proposal_id, user_id: @proposal_request.user_id } }
    end

    assert_redirected_to proposal_request_url(ProposalRequest.last)
  end

  test "should show proposal_request" do
    get proposal_request_url(@proposal_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposal_request_url(@proposal_request)
    assert_response :success
  end

  test "should update proposal_request" do
    patch proposal_request_url(@proposal_request), params: { proposal_request: { accepted: @proposal_request.accepted, accepted_on: @proposal_request.accepted_on, proposal_id: @proposal_request.proposal_id, user_id: @proposal_request.user_id } }
    assert_redirected_to proposal_request_url(@proposal_request)
  end

  test "should destroy proposal_request" do
    assert_difference('ProposalRequest.count', -1) do
      delete proposal_request_url(@proposal_request)
    end

    assert_redirected_to proposal_requests_url
  end
end
