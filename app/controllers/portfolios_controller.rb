class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  before_action :authenticate_user!, only: [:new, :create, :udpate, :destroy]
  layout 'carousel'
  # GET /portfolios
  def index
    @portfolios = Portfolio.all
  end

  # GET /portfolios/1
  def show
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
    @tags = Tag.all
  end

  # GET /portfolios/1/edit
  def edit
    @tags = Tag.all
  end

  # POST /portfolios
  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user = current_user
    if @portfolio.save
      redirect_to @portfolio, notice: 'Portfolio was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /portfolios/1
  def update
    if @portfolio.update(portfolio_params)
      redirect_to @portfolio, notice: 'Portfolio was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /portfolios/1
  def destroy
    @portfolio.destroy
    redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :cover_image, :user_id, :tags)
    end
end
