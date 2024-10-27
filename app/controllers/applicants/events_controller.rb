class Applicants::EventsController < ApplicationController
  before_action :authenticate_applicant!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @event_entry = EventEntry.new
    @event_comment = EventComment.new
  end
end
