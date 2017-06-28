class PortfolioItemsController < ApplicationController
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  layout 'proposals'
  # GET /portfolio_items
  def index
    @portfolio_items = PortfolioItem.where(portfolio_id: params[:portfolio_id])
  end

  # GET /portfolio_items/1
  def show
  end

  # GET /portfolio_items/new
  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @portfolio_item = PortfolioItem.new
  end

  # GET /portfolio_items/1/edit
  def edit
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  # POST /portfolio_items
  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    @portfolio_item = PortfolioItem.new(portfolio_item_params)
    @portfolio_item.portfolio = @portfolio
    if @portfolio_item.save
      redirect_to portfolio_portfolio_item_url(@portfolio_item.portfolio, @portfolio_item), notice: 'Portfolio item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /portfolio_items/1
  def update
    if @portfolio_item.update(portfolio_item_params)
      redirect_to portfolio_portfolio_item_url(@portfolio_item.portfolio, @portfolio_item), notice: 'Portfolio item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /portfolio_items/1
  def destroy
    @portfolio = @portfolio_item.portfolio
    @portfolio_item.destroy
    redirect_to portfolio_portfolio_items_url(@portfolio), notice: 'Portfolio item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_item
      @portfolio_item = PortfolioItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_item_params
      params.require(:portfolio_item).permit(:title, :cover_image, :description, :portfolio_id)
    end
end
