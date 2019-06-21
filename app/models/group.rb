class Group < ApplicationRecord
  mount_uploader :icon, ImageUploader

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :summary, presence: true

  has_many :joins, dependent: :destroy
  has_many :users, through: :joins
  has_many :comments, dependent: :destroy

  def decide_leader(user)
    # ここのcreateはコンソールでのcreateコマンドと同じ
    joins.create(user: user, is_leader: true)
  end

  def self.identify_leader(group)
    leader_id = group.joins.find_by(is_leader: true).user_id
    User.find(leader_id)
  end

  def self.group_leader?(group, user)
    leader_id = group.joins.find_by(is_leader: true).user_id
    user.id == leader_id
  end

  def self.group_member?(group, user)
    group.users.find_by(name: user&.name).present?
  end

  def self.group_members(group)
    members = []
    join_info = group.joins.where(is_leader: false)
    join_info.each do |info|
      members << User.find(info.user_id)
    end
    members
  end

  def invite_member(user, group)
    if Group.group_member?(group, user)
      "#{user.name}さんは既にグループに登録済みです。"
    elsif joins.create(user: user)
      "#{user.name}さんをグループに招待しました！"
    else
      "#{user.name}さんの招待に失敗しました。"
    end
  end
end
