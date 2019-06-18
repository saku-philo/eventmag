class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @leader = Group.identify_leader(@group)
    @members = Group.group_members(@group)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.decide_leader(current_user)
      redirect_to group_path(@group), notice: "グループ「#{@group.name}」を登録しました！"
    else
      redirect_to new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group),notice: "グループ「#{@group.name}」情報を更新しました！"
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :summary, :icon)
  end
end
