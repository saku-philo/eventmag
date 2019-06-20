class AttendsController < ApplicationController
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
end
