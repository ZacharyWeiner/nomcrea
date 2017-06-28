class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  layout 'proposals'
  # GET /proposals
  def index
    @proposals = Proposal.all
  end

  # GET /proposals/1
  def show
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals
  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.user = current_user 
    @proposal.company = current_user.company
    if @proposal.save
      redirect_to @proposal, notice: 'Proposal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /proposals/1
  def update
    if @proposal.update(proposal_params)
      redirect_to @proposal, notice: 'Proposal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /proposals/1
  def destroy
    @proposal.destroy
    redirect_to proposals_url, notice: 'Proposal was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.includes(:requirements).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def proposal_params
      params.require(:proposal).permit(:title, :content, :deadline, :price, :company_id, :user_id, :tag_list)
    end
end
