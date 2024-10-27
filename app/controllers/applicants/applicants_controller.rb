class Applicants::ApplicantsController < ApplicationController
  before_action :authenticate_applicant!
  before_action :find_applicant, except: %w(index)
  before_action :applicant_check, only: %w(edit update)

  def index
    @applicants = Applicant.all
  end

  def show
    @applicant=Applicant.find(params[:id])
  end

  def edit; end

  def update
    @applicant.update(applicant_params)
    redirect_to applicants_applicant_path(@applicant)
  end

  private

  def find_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_check
    redirect_to root_path, alert: '許可されていない動作です' unless @applicant == current_applicant
  end

  def applicant_params
    params.require(:applicant).permit(:name, :introduction, :profile_image)
  end
end
