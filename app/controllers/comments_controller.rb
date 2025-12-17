# x20245823 Alexandra
# This handles all of the comment actions
# Actions: create and destroy comments on tickets
# Access is restricted to authenticated users only

class CommentsController < ApplicationController
  before_action :authenticate_user!

  # Create a comment for a specific ticket
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @comment = @ticket.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @ticket, notice: "Comment added"
    else
      redirect_to @ticket, alert: @comment.errors.full_messages.to_sentence
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end





