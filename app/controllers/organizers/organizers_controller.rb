class Organizers::OrganizersController < ApplicationController
  before_action :authenticate_organizer!

  def index
    @organizers = Organizer.all
  end

  def show
     @organizer = Organizer.find(params[:id])
  end

  def edit; end

  def update
    @organizer.update(organizer_params)
    redirect_to organizers_organizer_path(@organizer)
  end

  def organizer_params
    params.require(:organizer).permit(:name, :introduction, :organizer_avatar)
  end
end
