class Admins::EventEntriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_event

  def destroy
    EventEntry.find_by(event_id: @event).destroy
    redirect_to admins_event_path(@event)
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def event_entry_params
    params.require(:event_entry).permit(:text)
  end
end
