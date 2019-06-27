class AttendsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_contributer

  def create
    @attend = current_user.attends.new(attend_params)
    if @attend.save
      redirect_to events_path, notice: "イベント：#{@attend.event.name}に参加を申し込みました！"
    else
      render :back
    end
  end

  def destroy
    @attend = Attend.find(params[:id])
    if @attend.destroy
      redirect_to events_path, alert: "イベント：#{@attend.event.name}の参加をキャンセルしました！"
    else
      render :back
    end
  end

  private

  def attend_params
    params.permit(:event_id)
  end

  def user_contributer
    event = Event.find(params[:event_id])
    redirect_to events_path, notice: "イベント投稿者は参加申し込み、キャンセルは出来ません！" if event.user == current_user
  end
end
