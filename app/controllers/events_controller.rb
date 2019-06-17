class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit destroy]
  before_action :check_contributor, only: %i[edit update destroy]

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
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to events_path, notice: "イベント「#{@event.name}」を登録しました！"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "イベント#{@event.name}の情報を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path, alert: "イベント#{@event.name}の情報を削除しました！"
    else
      render :index
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :date, :start_at, :end_at, :cost, :capacity, :link_url, :meta)
  end

  def check_contributor
    if current_user.id == Event.find(params[:id]).user.id
      @event = Event.find(params[:id])
    else
      redirect_to events_path, alert: "投稿者以外はイベントを編集、削除出来ません!"
    end
  end
end
