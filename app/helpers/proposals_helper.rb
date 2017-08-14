module ProposalsHelper

  def create_requirements(proposal)
    if proposal.proposal_type == 'photo'
      create_photo_tasks(proposal)
    elsif proposal.proposal_type == 'video'
      create_video_tasks(proposal)
    elsif proposal.proposal_type == 'drone'
      create_drone_tasks(proposal)
    end
  end

  def create_photo_tasks(proposal)
   requirements = []
   requirements << Requirement.create!(proposal: proposal, title: "Photo Task 1", description: "This is something that must be done before considered complete")
   requirements << Requirement.create!(proposal: proposal, title: "Photo Task 2", description: "This is something that must be done before considered complete")
   requirements << Requirement.create!(proposal: proposal, title: "Photo Task 3", description: "This is something that must be done before considered complete")
   requirements
  end

  def create_video_tasks(proposal)
    requirements = []
    requirements << Requirement.create!(proposal: proposal, title: "Video Task 1", description: "This is something that must be done before considered complete")
    requirements << Requirement.create!(proposal: proposal, title: "Video Task 2", description: "This is something that must be done before considered complete")
    requirements << Requirement.create!(proposal: proposal, title: "Video Task 3", description: "This is something that must be done before considered complete")
    requirements
  end

  def create_drone_tasks(proposal)
    requirements = []
    proposal.requirements << Requirement.create!(proposal: proposal, title: "Drone Task 1", description: "This is something that must be done before considered complete")
    proposal.requirements << Requirement.create!(proposal: proposal, title: "Drone Task 2", description: "This is something that must be done before considered complete")
    proposal.requirements << Requirement.create!(proposal: proposal, title: "Drone Task 3", description: "This is something that must be done before considered complete")
    requirements
  end

  def set_session_proposal_info(name, params)
    unless params[name].nil? || params[name] == nil
      session[name] = params[name]
      return true
    end
    return false
  end

  def set_session_proposal_add_ons(params)
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
  end

  def set_session_proposal_focus_points(params)
    focus_points = []
    if params[:top_left]
      focus_points << :top_left
    end
    if params[:top_center]
      focus_points << :top_center
    end
    if params[:top_right]
      focus_points << :top_right
    end
    if params[:middle_left]
      focus_points << :middle_left
    end
    if params[:middle_center]
      focus_points << :middle_center
    end
    if params[:middle_right]
      focus_points << :middle_right
    end
    if params[:bottom_left]
      focus_points << :bottom_left
    end
    if params[:bottom_center]
      focus_points << :bottom_center
    end
    if params[:bottom_right]
      focus_points << :bottom_right
    end
    session[:focus_points] = focus_points
    puts focus_points
  end

  def set_session_ci_guides(params)
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
  end

  def set_session_bts(params)
    if params[:photo]
      session[:photo] = true
    end
    if params[:video]
      session[:video] = true
    end
    if params[:setup]
      session[:setup] = true
    end
  end

  def construct_proposal_from_session
  end
end
