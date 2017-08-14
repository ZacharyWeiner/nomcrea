class ProposalMessagesController < ApplicationController
  before_action :set_proposal_message, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  layout 'theme'
  # GET /proposal_messages
  def index
    authenticate_user!
    @proposal= Proposal.find(params[:proposal_id])
    @proposal_message = ProposalMessage.new
    @proposal_messages = ProposalMessage.where(proposal: @proposal).order(created_at: :desc)
  end

  # GET /proposal_messages/1
  def show
  end

  # GET /proposal_messages/new
  def new
    @proposal_message = ProposalMessage.new
  end

  # GET /proposal_messages/1/edit
  def edit
  end

  # POST /proposal_messages
  def create
    @proposal = Proposal.find(params[:proposal_id])
    @proposal_message = ProposalMessage.new(proposal_message_params)
    if @proposal_message.save
      redirect_to  proposal_proposal_messages_path(@proposal), notice: 'Proposal message was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /proposal_messages/1
  def update
    if @proposal_message.update(proposal_message_params)
      redirect_to @proposal_message, notice: 'Proposal message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /proposal_messages/1
  def destroy
    @proposal_message.destroy
    redirect_to proposal_messages_url, notice: 'Proposal message was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal_message
      @proposal = Proposal.find(params[:proposal_id])
      @proposal_message = ProposalMessage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def proposal_message_params
      params.require(:proposal_message).permit(:message, :user_id, :proposal_id)
    end
end
