module ApplicationHelper
  def login_helper style, element
    if current_user
      if !element.nil?
        nav = "<#{element}>" + (link_to "Logout", destroy_user_session_path, method: :delete, class: style) + "</#{element}>"
        nav.html_safe
      else
        link_to "Logout", destroy_user_session_path, method: :delete, class: style 
      end  
     else 
      if !element.nil?
        nav = "<#{element}>" + (link_to "Register ", new_user_registration_path, class: style) + "</#{element}>" + "<#{element}>" + (link_to " Login", new_user_session_path, class: style) + "</#{element}>"
        nav.html_safe
      else 
        (link_to "Register ", new_user_registration_path, class: style) + 
        " ".html_safe +
        (link_to " Login", new_user_session_path, class: style)
      end
     end
  end
end
