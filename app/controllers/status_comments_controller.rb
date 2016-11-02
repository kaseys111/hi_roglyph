class StatusCommentsController < ApplicationController
  def index
    @status_comments = StatusComment.all
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
