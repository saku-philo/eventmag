class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :summary, presence: true

  has_many :joins, dependent: :destroy
  has_many :user, through: :joins
end
