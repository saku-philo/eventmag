class Event < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :place
    validates :date
    validates :start_at
    validates :cost
    validates :capacity
  end
end
