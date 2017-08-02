class ThemesController < ApplicationController
  layout 'theme'

  def theme
    @portfolios = Portfolio.take(3)
    render 'pages/theme'
  end

end 