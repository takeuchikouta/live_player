class Applicants::OrganizersController < ApplicationController
  before_action :authenticate_applicant!

  def index
    @organizers = Organizer.all
  end

  def show
    @organizer = Organizer.find(params[:id])
  end

end
