class FriendRequest < ApplicationRecord
  # Direct associations

  belongs_to :request_sender,
             :class_name => "User"

  # Indirect associations

  # Validations

end
