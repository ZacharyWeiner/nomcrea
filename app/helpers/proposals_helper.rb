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
end
