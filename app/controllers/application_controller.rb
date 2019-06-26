class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  protected

  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にname,iconのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name icon])
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def set_search
    @search = Event.ransack(params[:q])
    @search_events = @search.result.order(updated_at: 'DESC').page(params[:page])
  end
end
