class Applicants::EventCommentsController < ApplicationController
  before_action :authenticate_applicant!

  def create
    @event = Event.find(params[:event_id])
    comment = current_applicant.event_comments.new(event_comment_params)
    comment.event_id = @event.id
    comment.save
    redirect_to applicants_event_path(@event)
  end

  def destroy
    event_comment = EventComment.find(params[:id])
    event_comment.destroy if event_comment.applicant == current_applicant
    redirect_to applicants_event_path(event_comment.event)
  end

  private

  def event_comment_params
    params.require(:event_comment).permit(:comment)
  end
end
