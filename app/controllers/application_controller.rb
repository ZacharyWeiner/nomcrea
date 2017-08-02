class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_copyright
  before_action :configure_permitted_parameters, if: :devise_controller? 

  layout :layout_by_resource
  
  def set_copyright
    @copyright =(ZacksViewTool::Renderer.copyright 'NomCrea', 'All rights reserved')
  end

  protected 
  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :display_name, :profile_image,  :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :display_name, :profile_image,  :password,  :current_password])
  end

  def layout_by_resource
    if devise_controller?
      "theme"
    else
      "application"
    end
  end
end


module ZacksViewTool
  class Renderer
    def self.copyright name, msg
      ("<div class='center'>" + "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}" + "</div>").html_safe
    end
  end
end