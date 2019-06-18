class JoinsController < ApplicationController
  def create
    isleader = Join.find_by(@group.id).nil?
    @join = Join.new(user_id: 1, group_id: 6, is_leader: true)
    if @join.save
      redirect_to group_path(@group)
    else
      redirect_to new_group_path
    end
  end

  def destroy
  end
end
