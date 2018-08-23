class CommentsController < ApplicationController
  before_action :require_user
  before_action :set_comment_and_ticket, except: :create
  before_action :require_same_user, except: :create

  def create
    @comment = Comment.new(comment_params)
    @ticket = Ticket.find(params[:ticket_id])
    change_status
    if @comment.save
      flash[:notice] ? flash[:notice] += ' and Comment created' : flash[:notice] = 'Comment created'
      redirect_to ticket_path(params[:ticket_id])
    else
      render :edit
    end
  end

  def edit
  end

  def update
    change_status
    if @comment.update(comment_params)
      flash[:notice] ? flash[:notice] += ' and Comment updated' : flash[:notice] = 'Comment updated'
      redirect_to ticket_path(params[:ticket_id])
    else
      render :edit
    end
  end

  def destroy
    if Comment.destroy(params[:id])
      flash[:notice] = 'Project deleted'
    else
      flash[:error] = 'Something went wrong; project not deleted'
    end
    redirect_to ticket_path(params[:ticket_id])
  end

  private

  def comment_params
    if params.require(:comment).permit(:body)
      { body: params[:comment][:body], user_id: current_user.id, ticket_id: params[:ticket_id] }
    end
  end

  def ticket_params
    if params.require(:ticket).permit(:status) && params[:ticket][:status] != ''
      { status: params[:ticket][:status].to_i }
    end
  end

  def set_comment_and_ticket
    @comment = Comment.find(params[:id])
    @ticket = Ticket.find(params[:ticket_id])
  end

  def change_status
    if ticket_params && @ticket.update(ticket_params)
      flash[:notice] = 'Status updated'
    elsif ticket_params
      flash[:error] = 'Status could not be updated'
    end
  end

  def require_same_user
    if @comment.user_id != current_user.id
      flash[:error] = 'You may only edit and delete your own comments'
      redirect_to ticket_path(params[:ticket_id])
    end
  end
end