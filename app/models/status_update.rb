class StatusUpdate < ApplicationRecord
  # Direct associations

  has_many   :status_comments,
             :foreign_key => "status_id",
             :dependent => :destroy

  belongs_to :poster,
             :class_name => "User"

  # Indirect associations

  # Validations

end
