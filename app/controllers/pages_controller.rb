class PagesController < ApplicationController
  before_action :authenticate_user!, :only => [:my_portfolios, :my_proposals]
  layout 'carousel'
  def home
    @portfolios = Portfolio.take(3)
    @recent_portfolios = Portfolio.order(created_at: :desc).take(12)
  end 

  def my_portfolios
    @portfolios = Portfolio.where(user: current_user)
  end

  def my_proposals
    if current_user.company 
        @proposals = Proposal.where(company_id: current_user.company_id)
    else 
      @proposals = Proposal.where(user_id: current_user.id)
    end 
  end 

  
end 