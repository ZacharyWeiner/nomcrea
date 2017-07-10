class PagesController < ApplicationController
  before_action :authenticate_user!, :only => [:my_portfolios, :my_proposals]
  layout 'carousel'
  def home
    if current_user 
      if !current_user.has_roles?(:company) && !current_user.has_roles?(:creative)
        redirect_to select_role_path
      end
    end
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

  def my_requests
    @requests = ProposalRequest.where(user: current_user)
    puts @requests.count
  end

  def proposal_selection
    @portfolios = Portfolio.take(3)
    @recent_portfolios = Portfolio.order(created_at: :desc).take(12)
  end 

  def assign_role 
    current_user.roles=(params[:query])
    current_user.save
    if params[:query] == 'company'
      redirect_to my_proposals_path
    else 
      redirect_to proposals_path
    end
  end 
  
end 