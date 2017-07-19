class SearchController < ApplicationController
  before_action :set_proposal
  layout 'carousel'
  class SearchResult 
    def increment_score(adder) 
      if @score.nil? 
        score = 0 
      end 
      @score = @score + adder
    end 

    def set_user(user)
      @user = user
    end
  end 

  def search
   get_users_by_locations
  end 

  private 
  def set_proposal 
    if params[:id].nil?
      byebug  
    else 
      @proposal = Proposal.find(params[:id])
      get_users_by_locations
    end 
  end 

  def get_users_by_locations
    schedule_items = []
    locations = []
    get_location_parents(@proposal.location, locations)
    get_schedule_items_by_locations(locations, schedule_items)
    @results = schedule_items.map { |e| [e.schedule.user, e.end_date] }
    #create_results_collection(schedule_items)

  end 
  def create_results_collection(schedule_items)
    @search_results = []
    schedule_items.each do |si|
      result = create_search_result(user)
      @search_results << result
    end 
  end 

  def create_results(user)
    result_score = 0 
  end 

  def get_schedule_items_by_locations(locations, schedule_items)
    locations.each do |location|
      unless location.schedule_items.nil? || location.schedule_items.count == 0
        location.schedule_items.where('end_date < ?', @proposal.deadline).each do |si|
          schedule_items << si
        end 
      end 
    end
  end 

  def get_location_parents(tag, locations)
     locations << tag 
     while tag.parent.nil? == false  
      locations << tag.parent
      tag = tag.parent 
    end 
  end 
end