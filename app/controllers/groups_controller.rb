class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[show edit update destroy]
  before_action :check_leader, only: %i[edit update destroy]
  before_action :check_member, only: %i[show]

  def index
    @groups = Group.all
  end

  def show
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

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group), notice: "グループ「#{@group.name}」情報を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    if @group.destroy
      redirect_to user_path(id: current_user.id)
    else
      render :show
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :summary, :icon)
  end

  def set_group
    @group = Group.find(params[:id])
  end

  # ログインユーザーがグループのリーダーであるかを確認する
  def check_leader
    set_group
    redirect_to group_path(@group), notice: "リーダー以外は編集とか出来ません"\
    unless Group.check_leader(@group, current_user)
  end

  # グループメンバー以外はグループ情報を見れないようにする
  def check_member
    set_group
    redirect_to user_path(id: current_user.id), alert: "グループメンバー以外は見れません"\
    unless Group.check_member(@group, current_user)
  end
end
