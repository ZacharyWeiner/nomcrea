class UserPagesController < ApplicationController
  layout 'carousel'
  def my_skills
    @skills = Tag.skills 
    puts params
    to_remove = []
    to_add = []
    current_scenes = current_user.scenes.map { |e| e.id  }
    current_skills = current_user.skills.map { |e| e.id  }
    to_remove << current_scenes
    to_remove << current_skills
    if not params[:skills].nil?
      params[:skills].each do |skill|
        if to_remove.include?(skill) # user is already tagged with skill 
          to_remove.remove(skill) #delete from the key of skills to remove 
        else 
          to_add << skill #mark the skill that needs to be added 
        end 
      end 
    end
    if not params[:scenes].nil?
      params[:scenes].each do |scene|
        if to_remove.include?(scene) # user is already tagged with skill 
          to_remove.remove(scene) #delete from the key of skills to remove 
        else 
          to_add << scene #mark the skill that needs to be added 
        end 
      end 
    end

    to_remove.each do |skill|
      current_user.tags.delete(Tag.find(skill))
    end 
    to_add.each do |skill|
      current_user.tags << Tag.find(skill)
    end 
    render 'pages/user_pages/my_skills'
  end 
end