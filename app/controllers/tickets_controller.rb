class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :authorize_ticket!, only: [:edit, :update, :destroy]

  def index
    @tickets = policy_scope(Ticket)  # ✅ FIXED: only show allowed tickets
  end

  def show
    authorize @ticket
  end

  def new
    @ticket = Ticket.new
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    authorize @ticket

    if @ticket.save
      redirect_to @ticket, notice: "Ticket was created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @ticket
  end

  def update
    authorize @ticket
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: "Ticket was updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @ticket
    @ticket.destroy
    redirect_to tickets_path, notice: "Ticket was deleted."
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def authorize_ticket!
    authorize @ticket
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :priority)
  end
end


