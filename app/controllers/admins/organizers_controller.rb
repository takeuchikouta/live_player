class Admins::OrganizersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @organizers = Organizer.all
  end
  
  def update
    Organizer.find(params[:id]).toggle!(:is_active)
    redirect_to admins_organizers_path
  end
end
