module UsersHelper
  def user_apply_event?(event)
    guest_ids = event.attends.map(&:user_id)
    guest_ids.include?(current_user.id)
  end

  def user_contribute_event?(event)
    event.user.id == current_user.id
  end
end
