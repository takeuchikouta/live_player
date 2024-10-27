class Organizers::ApplicantsController < ApplicationController
  before_action :authenticate_organizer!

  def index
    @applicants=Applicant.all
  end

  def show
    @applicant=Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:name, :introduction, :profile_image)
  end
end
