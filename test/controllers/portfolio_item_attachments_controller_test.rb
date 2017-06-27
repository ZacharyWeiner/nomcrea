require 'test_helper'

class PortfolioItemAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio_item_attachment = portfolio_item_attachments(:one)
  end

  test "should get index" do
    get portfolio_item_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_portfolio_item_attachment_url
    assert_response :success
  end

  test "should create portfolio_item_attachment" do
    assert_difference('PortfolioItemAttachment.count') do
      post portfolio_item_attachments_url, params: { portfolio_item_attachment: { attachement: @portfolio_item_attachment.attachement, portfolio_item_id: @portfolio_item_attachment.portfolio_item_id } }
    end

    assert_redirected_to portfolio_item_attachment_url(PortfolioItemAttachment.last)
  end

  test "should show portfolio_item_attachment" do
    get portfolio_item_attachment_url(@portfolio_item_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_portfolio_item_attachment_url(@portfolio_item_attachment)
    assert_response :success
  end

  test "should update portfolio_item_attachment" do
    patch portfolio_item_attachment_url(@portfolio_item_attachment), params: { portfolio_item_attachment: { attachement: @portfolio_item_attachment.attachement, portfolio_item_id: @portfolio_item_attachment.portfolio_item_id } }
    assert_redirected_to portfolio_item_attachment_url(@portfolio_item_attachment)
  end

  test "should destroy portfolio_item_attachment" do
    assert_difference('PortfolioItemAttachment.count', -1) do
      delete portfolio_item_attachment_url(@portfolio_item_attachment)
    end

    assert_redirected_to portfolio_item_attachments_url
  end
end
