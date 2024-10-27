class Admins::ApplicantsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @applicants = Applicant.all
  end

  def update
    Applicant.find(params[:id]).toggle!(:is_active)
    redirect_to admins_applicants_path
  end
end
