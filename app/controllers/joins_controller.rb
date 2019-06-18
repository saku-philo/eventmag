class JoinsController < ApplicationController
  def create
    @join = Join.new(user_id: current_user.id, group_id: @group.id)
    if @join.save
      redirect_to group_path(@group)
    else
      redirect_to new_group_path
    end
  end

  def destroy; end
end
