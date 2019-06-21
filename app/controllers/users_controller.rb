class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @groups = @user.groups.all
    @events = @user.attends.map(&:event)
    @user_planning_events = @user.events
  end
end
