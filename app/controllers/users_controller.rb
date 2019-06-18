class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @groups = @user.groups.all
  end
end
