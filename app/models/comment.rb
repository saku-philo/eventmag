class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :group
  belongs_to :user
end
