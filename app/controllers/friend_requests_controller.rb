class FriendRequestsController < ApplicationController
  def index
    @friend_requests = FriendRequest.all
  end

  def show
    @friend_request = FriendRequest.find(params[:id])
  end

  def new
    @friend_request = FriendRequest.new
  end

  def create
    @friend_request = FriendRequest.new
    @friend_request.request_sender_id = params[:request_sender_id]
    @friend_request.request_receiver_id = params[:request_receiver_id]

    if @friend_request.save
      redirect_to "/friend_requests", :notice => "Friend request created successfully."
    else
      render 'new'
    end
  end

  def edit
    @friend_request = FriendRequest.find(params[:id])
  end

  def update
    @friend_request = FriendRequest.find(params[:id])

    @friend_request.request_sender_id = params[:request_sender_id]
    @friend_request.request_receiver_id = params[:request_receiver_id]

    if @friend_request.save
      redirect_to "/friend_requests", :notice => "Friend request updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])

    @friend_request.destroy

    redirect_to "/friend_requests", :notice => "Friend request deleted."
  end
end
