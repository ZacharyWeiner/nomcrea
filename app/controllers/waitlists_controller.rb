class WaitlistsController < ApplicationController
  before_action :set_waitlist, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  layout 'theme'
  # GET /waitlists
  def index
    @waitlists = Waitlist.all
  end

  # GET /waitlists/1
  def show
  end

  # GET /waitlists/new
  def new
    @waitlist = Waitlist.new
  end

  # GET /waitlists/1/edit
  def edit
  end

  # POST /waitlists
  def create
    @waitlist = Waitlist.new(waitlist_params)

    if @waitlist.save
      redirect_to @waitlist, notice: 'Waitlist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /waitlists/1
  def update
    if @waitlist.update(waitlist_params)
      redirect_to @waitlist, notice: 'Waitlist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /waitlists/1
  def destroy
    @waitlist.destroy
    redirect_to waitlists_url, notice: 'Waitlist was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waitlist
      @waitlist = Waitlist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def waitlist_params
      params.require(:waitlist).permit(:name, :email, :instagram, :px500, :facebook, :phone, :website, :smugmug)
    end
end
