class ProposalRequestsController < ApplicationController
  before_action :set_proposal_request, only: [:show, :edit, :update, :destroy]
  before_action :set_proposal, only: [:new, :create, :add_request]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  layout 'carousel'
  # GET /proposal_requests
  def index
    @proposal_requests = ProposalRequest.all
  end

  # GET /proposal_requests/1
  def show
  end

  # GET /proposal_requests/new
  def new
    @proposal_request = ProposalRequest.new
  end

  # GET /proposal_requests/1/edit
  def edit
  end

  # POST /proposal_requests
  def create
    byebug
    @proposal_request = ProposalRequest.new(proposal_request_params)
    @proposal_request.user = current_user
    @proposal_request.company = @proposal.company
    @proposal_request.proposal = @proposal
    if current_user.company? 
      @proposal_request.requested_by = 'company'
    else
      @proposal_request.requested_by = 'creative'
    end 
    if @proposal_request.save
      redirect_to @proposal_request, notice: 'Proposal request was successfully created.'
    else
      render :new
    end
  end

  def add_request
    @proposal_request = ProposalRequest.new
    if current_user.company
      query_string = CGI.parse(params[:query])
      @proposal_request.user = User.find(query_string['creative_id'].first.to_i)
    else 
      @proposal_request.user = current_user
    end
    
    @proposal_request.company = @proposal.company
    @proposal_request.proposal = @proposal
    if current_user.company == nil
      @proposal_request.requested_by = 'company'
    else
      @proposal_request.requested_by = 'creative'
    end 
    if @proposal_request.save
      redirect_to my_requests_path
    end
  end 

  def accept_request
    set_proposal_request
    @proposal_request.accepted = true
    if @proposal_request.save  
      redirect_to my_requests_path
    end 
  end 

  def available_proposals

    query_string = CGI.parse(params[:query])
    @creative = User.find(query_string['creative_id'].first )
    @proposals = Proposal.where(company: current_user.company).where(accepted: false)
      #render layout: 'modal'
  end 

  # PATCH/PUT /proposal_requests/1
  def update
    if @proposal_request.update(proposal_request_params)
      redirect_to @proposal_request, notice: 'Proposal request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /proposal_requests/1
  def destroy
    @proposal_request.destroy
    redirect_to proposal_requests_url, notice: 'Proposal request was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal_request
      @proposal_request = ProposalRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def proposal_request_params
      params.require(:proposal_request).permit(:proposal_id, :user_id, :accepted, :accepted_on)
    end

    def set_proposal
      if params[:id]
        @proposal = Proposal.find(params[:id])
      else 
        query_string = CGI.parse(params[:query])
        proposal_id = query_string['proposal_id'].first.to_i
        @proposal = Proposal.find(proposal_id)
      end 
    end 
end
