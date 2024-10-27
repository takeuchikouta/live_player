class Organizers::EventEntriesController < ApplicationController
  def destroy
    event_entry = current_organizer.events.find(params[:event_id]).event_entries.find(params[:id])
    event_entry.destroy
    redirect_to organizers_event_path(params[:event_id])
  rescue
    redirect_to root_path, alert: '許可されない操作がされました。'
  end
end
