module UsersHelper
  def user_apply_event?(user, event)
    guest_ids = event.attends.map { |a| a.user_id }
    guest_ids.include?(user.id)
  end
end
