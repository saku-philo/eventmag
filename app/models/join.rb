class Join < ApplicationRecord
  belongs_to :user
  belongs_to :group#, inverse_of: :joins
end
