class PagesController < ApplicationController
  before_action :authenticate_user!, :only => [:my_portfolios, :my_proposals]
  layout 'carousel'
  def home
    @portfolios = Portfolio.take(3)
  end 

  def my_portfolios
    @portfolios = Portfolio.where(user_id: current_user.id)
  end

  def my_proposals
    if user.company 
        @proposals = Proposals.where(company_id: user.company_id)
    else 
      @proposals = Proposals.where(user_id: current_user.id)
    end 
  end 

  
end 