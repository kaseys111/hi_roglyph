class StatusCommentsController < ApplicationController
  before_action :current_user_must_be_status_comment_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_status_comment_user
    status_comment = StatusComment.find(params[:id])

    unless current_user == status_comment.commenter
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @status_comments = StatusComment.page(params[:page])
  end

  def show
    @status_comment = StatusComment.find(params[:id])
  end

  def new
    @status_comment = StatusComment.new
  end

  def create
    @status_comment = StatusComment.new
    @status_comment.status_id = params[:status_id]
    @status_comment.comment = params[:comment]
    @status_comment.commenter_id = params[:commenter_id]

    if @status_comment.save
      redirect_to "/status_comments", :notice => "Status comment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @status_comment = StatusComment.find(params[:id])
  end

  def update
    @status_comment = StatusComment.find(params[:id])

    @status_comment.status_id = params[:status_id]
    @status_comment.comment = params[:comment]
    @status_comment.commenter_id = params[:commenter_id]

    if @status_comment.save
      redirect_to "/status_comments", :notice => "Status comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @status_comment = StatusComment.find(params[:id])

    @status_comment.destroy

    redirect_to "/status_comments", :notice => "Status comment deleted."
  end
end
