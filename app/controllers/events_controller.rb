class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path, notice: "イベント#{@event.name}の情報を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to events_path, alert: "イベント#{@event.name}の情報を削除しました！"
    else
      render :index
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :date, :start_at, :end_at, :cost, :capacity, :meta)
  end
end
