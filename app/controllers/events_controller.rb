class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show; end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, notice: "イベント「#{@event.name}」を登録しました！"
    else
      render :new
    end
  end

  def edit; end
end

private

def event_params
  params.require(:event).permit(:name, :place, :date, :start_at, :end_at, :cost, :capacity, :meta)
end
