class ScheduleItemsController < ApplicationController
  before_action :set_schedule_item, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  layout 'carousel'
  # GET /schedule_items
  def index
    @schedule_items = ScheduleItem.all
  end

  # GET /schedule_items/1
  def show
  end

  # GET /schedule_items/new
  def new
    @schedule_item = ScheduleItem.new
  end

  # GET /schedule_items/1/edit
  def edit
    @location_tag = @schedule_item.tags.first.id
    byebug
  end

  # POST /schedule_items
  def create
    @schedule_item = ScheduleItem.new(schedule_item_params)
    @schedule_item.schedule = current_user.schedule
    if @schedule_item.save
      redirect_to @schedule_item, notice: 'Schedule item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /schedule_items/1
  def update
    if @schedule_item.update(schedule_item_params)
      @schedule_item.schedule = current_user.schedule
      redirect_to @schedule_item, notice: 'Schedule item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /schedule_items/1
  def destroy
    @schedule_item.destroy
    redirect_to schedule_items_url, notice: 'Schedule item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_item
      @schedule_item = ScheduleItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def schedule_item_params
      params.require(:schedule_item).permit(:item_type, :start_date, :end_date, :tag_id, :schedule_id, :title)
    end
end
