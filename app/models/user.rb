class User < ApplicationRecord
  before_save :geocode_location

  def geocode_location
    if self.location.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
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
