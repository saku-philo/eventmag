module UsersHelper
  def user_apply_event?(user, event)
    guest_ids = event.attends.map(&:user_id)
    guest_ids.include?(user.id)
  end
end
