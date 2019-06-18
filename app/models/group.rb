class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :summary, presence: true

  has_many :joins, dependent: :destroy
  has_many :users, through: :joins

  def decide_leader(user)
    # ここのcreateはコンソールでのcreateコマンドと同じ
    joins.create(user: user, is_leader: true)
  end

  def self.identify_leader(group)
    leader_id = group.joins.find_by(is_leader: true).user_id
    User.find(leader_id)
  end

  def self.group_members(group)
    members = []
    join_info = group.joins.where(is_leader: false)
    join_info.each do |info|
      members << User.find(info.user_id)
    end
    members
  end
end
