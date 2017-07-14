class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  layout 'carousel'
  autocomplete :tag, :name

  include ProposalsHelper
  # GET /proposals
  def index
    @proposals = Proposal.available
  end

  # GET /proposals/1
  def show
    @requests = @proposal.proposal_requests.where(user: current_user)
  end

  # GET /proposals/new
  def new
    @skills = Tag.where(tag_type: 'skill').collect{ |p| [p.name, p.id]}
    set_locations
    @scenes = Tag.where(tag_type: 'scene').collect{|p| [p.name, p.id]}
    @proposal = Proposal.new
     if params[:query] != nil
        set_proposal_type
     end
  end

  # GET /proposals/1/edit
  def edit
    @skills = Tag.where(tag_type: 'skill').collect{ |p| [p.name, p.id]}
    set_locations
    @scenes = Tag.where(tag_type: 'scene').collect{|p| [p.name, p.id]}
    
  end

  # POST /proposals
  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.user = current_user 
    @proposal.company = current_user.company
    if @proposal.save
      @proposal.requirements << create_requirements(@proposal)
      redirect_to @proposal, notice: 'Proposal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /proposals/1
  def update
    if @proposal.update(proposal_params)
      tag_ids= [] 
      
      params[:proposal][:scenes].collect{ |scene_id|
        if scene_id != "" 
          tag_ids << scene_id.to_i
        end 
      }
 
      tag_ids << params[:proposal][:location].to_i
      params[:proposal][:skills].collect{ |skill_id|
        if skill_id != "" 
          tag_ids << skill_id.to_i
        end 
      }
      @proposal.tags.clear
      @proposal.tags = Tag.where(id: tag_ids)

      byebug
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
      params.require(:proposal).permit(:title, :content, :deadline, :price, :proposal_type, :company_id, :user_id)
    end

    def set_locations
      regions = Tag.where(tag_type: ['region'])
      @locations= []
      regions.collect do |region|
        @locations << [region.name, region.id]
        Tag.where(parent_id: region.id).each do |country|
          @locations << ["." + country.name, country.id]
          Tag.where(parent_id: country.id).each do |city|
            @locations << [".." + city.name, city.id]
          end 
        end 
      end
    end

    def set_proposal_type
      if params[:query] == 'photo'
        @proposal.price = '5000.00'
        @proposal.proposal_type = 'photo'
      elsif params[:query] == 'video'
        @proposal.price = '8000.00'
        @proposal.proposal_type = 'video'
      elsif params[:query] == 'drone'
        @proposal.price = '1000.00'
        @proposal.proposal_type = 'drone'
      else
        @proposal.price = '10000'
      end
    end 
end
