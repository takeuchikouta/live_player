class Organizers::EventsController < ApplicationController
  before_action :authenticate_organizer!

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.organizer_id = current_organizer.id
    if @event.save
      redirect_to organizers_event_path(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to organizers_organizer_path(@event.organizer)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy if @event.organizer == current_organizer
    redirect_to organizers_organizer_path(@event.organizer)
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :image)
  end
end
