class Applicants::BookmarksController < ApplicationController
  before_action :authenticate_applicant!

  def index
    @bookmarks = current_applicant.bookmarks
  end

  def create
    Bookmark.create(applicant_id: current_applicant.id, event_id: params[:event_id])
    redirect_to applicants_event_path(params[:event_id])
  end

  def destroy
    Bookmark.find_by(applicant_id: current_applicant.id, event_id: params[:event_id]).destroy
    redirect_to applicants_event_path(params[:event_id])
  end
end
