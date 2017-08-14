class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]
  #access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  layout 'theme'
  autocomplete :tag, :name

  include ProposalsHelper
  # GET /proposals
  def index
    @proposals = Proposal.available
  end

  # GET /proposals/1
  def show
    @requests = @proposal.proposal_requests.where(user: current_user)
    render 'show'
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
    #@skills = Tag.where(tag_type: 'skill').collect{ |p| [p.name, p.id]}
   @skills = Tag.where(tag_type: 'skill').collect{ |p| [p.name, p.id]}
    set_locations
    @scenes = Tag.where(tag_type: 'scene').collect{|p| [p.name, p.id]}

    @proposal_skills= @proposal.tags.where(tag_type:'skill').pluck(:id)
    puts @proposal_skills


  end

  # POST /proposals
  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.user = current_user
    @proposal.company = current_user.company
    if @proposal.save
      @proposal.requirements << create_requirements(@proposal)
      update_tags
      redirect_to @proposal, notice: 'Proposal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /proposals/1
  def update
    if @proposal.update(proposal_params)
      update_tags
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

  def set_demo_client_info
    email_valid = set_session_proposal_info(:email, params)
    name_valid = set_session_proposal_info(:name, params)
    company_valid = set_session_proposal_info(:company, params)
    if email_valid && name_valid && company_valid
      construct_proposal_from_session
    else
      redirect_to proposal_wizard_client_info_path, notice: 'Please Enter Your Name & Email Address'
    end
  end

  def set_proposal_title
    title_valid = set_session_proposal_info(:title, params)
    if title_valid
      render 'proposals/wizard_steps/brief'
    else
       render 'proposals/wizard_steps/title', notice: "Please Enter a Title"
    end
  end

  def set_proposal_brief
    brief_valid = set_session_proposal_info(:brief, params)
    if brief_valid
      render 'proposals/wizard_steps/content_type'
    else
      render 'proposals/wizard_steps/brief'
    end
  end

  def set_proposal_content_type
    content_type_valid = set_session_proposal_info(:content_type, params)
    if content_type_valid
      render 'proposals/wizard_steps/add_ons'
    else
      render 'proposals/wizard_steps/content_type'
    end
  end

  def set_proposal_add_ons
    set_session_proposal_add_ons(params)
    render '/proposals/wizard_steps/focus_points'
  end

  def set_proposal_focus_points
    set_session_proposal_focus_points(params)
    render 'proposals/wizard_steps/ci_guides'
  end

  def set_proposal_ci_guides
    set_session_ci_guides(params)
    render 'proposals/wizard_steps/scene_type'
  end

  def set_proposal_scene
    scene_valid = set_session_proposal_info(:scene, params)
    if scene_valid
      render 'proposals/wizard_steps/bts'
    else
      render 'proposals/wizard_steps/scene_type'
    end
  end

  def set_proposal_bts
    if params[:authenticity_token]
      set_session_bts(params)
      render 'proposals/wizard_steps/client_info'
    else
      render 'proposals/wizard_steps/bts'
    end
  end

  def step_0
    render '/proposals/wizard_steps/step_0'
  end

  def step_1
    render '/proposals/wizard_steps/step_1'
  end

  def step_2
    email_valid = set_session_proposal_info(:email, params)
    name_valid = set_session_proposal_info(:name, params)
    if email_valid && name_valid
      render '/proposals/wizard_steps/step_2'
    else
      render '/proposals/wizard_steps/step_1'
    end
  end

  def step_3
    unless params[:title].nil? || params[:brief].nil?
      session[:title] = params[:title]
      session[:brief] = params[:brief]
      render '/proposals/wizard_steps/step_3'
    else
      render '/proposals/wizard_steps/step_2'
    end
  end

  def step_4
    unless params[:scene].nil?
      session[:scene] = params[:scene]
      render '/proposals/wizard_steps/step_4'
    else
      render '/proposals/wizard_steps/step_3'
    end
  end

  def step_5
    if params[:model]
      session[:model] = true
    end
    if params[:hmu]
      session[:hmu] = true
    end
    if params[:local]
      session[:local] = true
    end
    if params[:stylist]
      session[:stylist] = true
    end
    render '/proposals/wizard_steps/step_5'
  end

  def step_6
    focus_locations = []
    if params[:top_left]
      focus_locations << :top_left
    end
    if params[:top_center]
      focus_locations << :top_center
    end
    if params[:top_right]
      focus_locations << :top_right
    end
    if params[:middle_left]
      focus_locations << :middle_left
    end
    if params[:middle_center]
      focus_locations << :middle_center
    end
    if params[:middle_right]
      focus_locations << :middle_right
    end
    if params[:bottom_left]
      focus_locations << :bottom_left
    end
    if params[:bottom_center]
      focus_locations << :bottom_center
    end
    if params[:bottom_right]
      focus_locations << :bottom_right
    end
    session[:focus_locations] = focus_locations
    puts focus_locations
    render '/proposals/wizard_steps/step_6'
  end

  def step_7
    if params[:ci_1]
      session[:ci_1] = params[:ci_1]
    end
    if params[:ci_2]
      session[:ci_2] = params[:ci_2]
    end
    if params[:ci_3]
      session[:ci_3] = params[:ci_3]
    end
    if params[:ci_4]
      session[:ci_4] = params[:ci_4]
    end
    render '/proposals/wizard_steps/step_7'
  end
  def step_8
    if params[:location]
      session[:location] = params[:location]
      render '/proposals/wizard_steps/step_8'
    else
      render '/proposals/wizard_steps/step_7'
    end
  end

  def step_9
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

    def update_tags
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
