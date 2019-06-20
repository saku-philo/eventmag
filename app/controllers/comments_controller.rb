class CommentsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @comment = @group.comments.build(comment_params)
    if @comment.save
      redirect_to group_path(@group)
    else
      format.html { redirect_to group_path(@group), alert: '投稿できませんでした...' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end
end
