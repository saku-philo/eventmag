class TopController < ApplicationController
  def index
    @q = Event.all.ransack(params[:q])
    @events = @q.result(distinct: true).order(updated_at: 'DESC').limit(6)
    @groups = Group.order(updated_at: 'DESC').limit(5)
  end
end
