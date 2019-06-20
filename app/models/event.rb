class Event < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { maximum: 100 }
  with_options presence: true do
    validates :place
    validates :date
    validates :start_at
    validates :cost
    validates :capacity
  end

  belongs_to :user
end
