class UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
    @location_hash = Gmaps4rails.build_markers(@users.where.not(:location_latitude => nil)) do |user, marker|
      marker.lat user.location_latitude
      marker.lng user.location_longitude
      marker.infowindow "<h5><a href='/users/#{user.id}'>#{user.created_at}</a></h5><small>#{user.location_formatted_address}</small>"
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
