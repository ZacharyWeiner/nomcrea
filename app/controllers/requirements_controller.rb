class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy, :accept_requirement]
  before_action :set_proposal, only: [:index, :new, :create, :show, :update, :accept_requirement]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /requirements
  def index
    @requirements = Requirement.where(proposal_id: @proposal.id)
  end

  # GET /requirements/1
  def show
  end

  # GET /requirements/new
  def new
    @requirement = Requirement.new
  end

  # GET /requirements/1/edit
  def edit
  end

  # POST /requirements
  def create
    @requirement = Requirement.new(requirement_params)
    @requirement.proposal = @proposal
    if @requirement.save
      redirect_to proposal_requirement_path(@proposal, @requirement), notice: 'Requirement was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /requirements/1
  def update
    if @requirement.update(requirement_params)
      @requirement.proposal = @proposal
      redirect_to proposal_requirement_path(@proposal, @requirement), notice: 'Requirement was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /requirements/1
  def destroy
    @requirement.destroy
    redirect_to requirements_url, notice: 'Requirement was successfully destroyed.'
  end

  def accept_requirement
    @requirement.accepted = 1
    if @requirement.save
      @proposal.is_complete
      byebug
      redirect_to proposal_path(@proposal), notice: 'Requirement has been accepted.'
    else
      render :new
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def requirement_params
      params.require(:requirement).permit(:title, :description, :accepted, :proposal_id)
    end

    def set_proposal
      @proposal = Proposal.find(params[:proposal_id])
    end
end
