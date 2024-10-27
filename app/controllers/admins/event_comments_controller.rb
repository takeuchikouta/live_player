class Admins::EventCommentsController < ApplicationController
  def destroy
    event_comment = EventComment.find(params[:id])
    event_comment.destroy
    redirect_to admins_event_path(params[:event_id])
  end
end
