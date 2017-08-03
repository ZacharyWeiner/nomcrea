class ContactSubmissionController < ApplicationController
layout 'theme'
  def save
    @contact_submission = ContactSubmission.create(submission_params)
    @contact_submission.save
    redirect_to root_path, notice: 'Portfolio item was successfully created.'
  end

  def index
    @contact_submissions = ContactSubmission.all
  end 

  protected
  def submission_params
      params.require(:contact_submission).permit(:name, :email, :message)
    end
end
