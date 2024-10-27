class Applicants::EventEntriesController < ApplicationController
  before_action :authenticate_applicant!
  before_action :find_event

  def create
    entry = current_applicant.event_entries.new(event_entry_params)
    entry.event_id = @event.id
    entry.save
    redirect_to applicants_event_path(@event)
  end

  def destroy
    current_applicant.event_entries.find_by(event_id: @event).destroy
    redirect_to applicants_event_path(@event)
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def event_entry_params
    params.require(:event_entry).permit(:text)
  end
end
