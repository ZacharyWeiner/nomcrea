class ProposalRequestsController < ApplicationController
  before_action :set_proposal_request, only: [:show, :edit, :update, :destroy]
  before_action :set_proposal, only: [:new, :create, :add_request]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

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
      byebug
      render :new
    end
  end

  def add_request
    byebug
    @proposal_request = ProposalRequest.new
    @proposal_request.user = current_user
    @proposal_request.company = @proposal.company
    @proposal_request.proposal = @proposal
    if @proposal_request.save
      redirect_to my_requests_path
    end
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
      @proposal = Proposal.find(params[:id])
    end 
end
