class ProposalRequestsController < ApplicationController
  before_action :set_proposal_request, only: [:show, :edit, :update, :destroy]
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
    @proposal_request = ProposalRequest.new(proposal_request_params)

    if @proposal_request.save
      redirect_to @proposal_request, notice: 'Proposal request was successfully created.'
    else
      render :new
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
end
