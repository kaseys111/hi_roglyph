class StatusComment < ApplicationRecord
  # Direct associations

  belongs_to :status,
             :class_name => "StatusUpdate",
             :counter_cache => true

  belongs_to :commenter,
             :class_name => "User"

  # Indirect associations

  # Validations

end
