class User < ApplicationRecord
  # Direct associations

  has_many   :status_comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  has_many   :status_updates,
             :foreign_key => "poster_id",
             :dependent => :destroy

  has_many   :friends__user_is_friended,
             :class_name => "FriendRequest",
             :foreign_key => "request_receiver_id",
             :dependent => :destroy

  has_many   :friends__user_is_friender,
             :class_name => "FriendRequest",
             :foreign_key => "request_sender_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
