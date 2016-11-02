class StatusUpdatesController < ApplicationController
  before_action :current_user_must_be_status_update_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_status_update_user
    status_update = StatusUpdate.find(params[:id])

    unless current_user == status_update.poster
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @status_updates = StatusUpdate.all
  end

  def show
    @status_update = StatusUpdate.find(params[:id])
  end

  def new
    @status_update = StatusUpdate.new
  end

  def create
    @status_update = StatusUpdate.new
    @status_update.status = params[:status]
    @status_update.poster_id = params[:poster_id]

    if @status_update.save
      redirect_to "/status_updates", :notice => "Status update created successfully."
    else
      render 'new'
    end
  end

  def edit
    @status_update = StatusUpdate.find(params[:id])
  end

  def update
    @status_update = StatusUpdate.find(params[:id])

    @status_update.status = params[:status]
    @status_update.poster_id = params[:poster_id]

    if @status_update.save
      redirect_to "/status_updates", :notice => "Status update updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @status_update = StatusUpdate.find(params[:id])

    @status_update.destroy

    redirect_to "/status_updates", :notice => "Status update deleted."
  end
end
