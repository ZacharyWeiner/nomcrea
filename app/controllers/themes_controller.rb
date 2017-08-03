class ThemesController < ApplicationController
  layout 'theme'

  def theme
    @contact_submission = ContactSubmission.new
    @portfolios = Portfolio.take(3)
    render 'pages/theme'
  end

end 