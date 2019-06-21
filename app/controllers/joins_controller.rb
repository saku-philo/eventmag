class JoinsController < ApplicationController
  before_action :authenticate_user!

  def create
    group = Group.find(join_params[:group_id])
    user = User.find_by(name: join_params[:user_name])
    if user
      @info = group.invite_member(user, group)
      redirect_to group_path(group), notice: @info.to_s
    else
      redirect_to group_path(group), alert: "#{join_params[:user_name]}さんは未登録のようです。確認してください"
    end
  end

  def destroy; end

  private

  def join_params
    params.permit(:group_id, :user_name)
  end
end
