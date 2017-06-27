class PortfolioItemAttachmentsController < ApplicationController
  before_action :set_portfolio_item_attachment, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /portfolio_item_attachments
  def index
    @portfolio_item_attachments = PortfolioItemAttachment.all
  end

  # GET /portfolio_item_attachments/1
  def show
  end

  # GET /portfolio_item_attachments/new
  def new
    set_parents 'params'
    @portfolio_item_attachment = PortfolioItemAttachment.new
  end

  # GET /portfolio_item_attachments/1/edit
  def edit
    set_parents 'object'
  end

  # POST /portfolio_item_attachments
  def create
    set_parents 'params'
    @portfolio_item_attachment = PortfolioItemAttachment.new(portfolio_item_attachment_params)
    @portfolio_item_attachment.portfolio_item = @portfolio_item

    if @portfolio_item_attachment.save
      redirect_to portfolio_portfolio_item_portfolio_item_attachment_url(@portfolio_item.portfolio, @portfolio_item, @portfolio_item_attachment), notice: 'Portfolio item attachment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /portfolio_item_attachments/1
  def update
    set_parents 'object'
    if @portfolio_item_attachment.update(portfolio_item_attachment_params)
      redirect_to portfolio_portfolio_item_portfolio_item_attachment_url(@portfolio_item.portfolio, @portfolio_item, @portfolio_item_attachment), notice: 'Portfolio item attachment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /portfolio_item_attachments/1
  def destroy
    set_parents 'object'
    @portfolio_item_attachment.destroy
    redirect_to portfolio_portfolio_item_portfolio_item_attachments_url(@portfolio, @portfolio_item), notice: 'Portfolio item attachment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_item_attachment
      @portfolio_item_attachment = PortfolioItemAttachment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_item_attachment_params
      params.require(:portfolio_item_attachment).permit(:attachement, :portfolio_item_id)
    end

    def set_parents by_type
      if by_type == 'params'
        @portfolio = Portfolio.find(params[:portfolio_id])
        @portfolio_item = PortfolioItem.find(params[:portfolio_item_id])
      elsif by_type == 'object'
        @portfolio = @portfolio_item_attachment.portfolio_item.portfolio
        @portfolio_item = @portfolio_item_attachment.portfolio_item
      end
    end 
end
