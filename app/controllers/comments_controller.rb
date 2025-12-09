class CommentsController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @comment = @ticket.comments.create(comment_params)
    redirect_to ticket_path(@ticket)
  end

  def destroy
    @ticket = Ticket.find(params[:ticket_id])
    @comment = @ticket.comments.find(params[:id])
    @comment.destroy
    redirect_to ticket_path(@ticket)
  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :content)
  end
end


