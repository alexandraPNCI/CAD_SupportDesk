class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @comment = @ticket.comments.build(comment_params)
    @comment.user = current_user    # assign user to comment

    authorize @comment              # Pundit authorization

    if @comment.save
      redirect_to @ticket, notice: "Comment added."
    else
      redirect_to @ticket, alert: "Comment could not be saved."
    end
  end

  def destroy
    @ticket = Ticket.find(params[:ticket_id])
    @comment = @ticket.comments.find(params[:id])

    authorize @comment              # Pundit authorization

    @comment.destroy
    redirect_to @ticket, notice: "Comment deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end



