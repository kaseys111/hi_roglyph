class StatusUpdate < ApplicationRecord
  # Direct associations

  belongs_to :poster,
             :class_name => "User"

  # Indirect associations

  # Validations

end
