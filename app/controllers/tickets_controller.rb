class TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = Ticket.all
    authorize @tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  def new
    @ticket = Ticket.new
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    authorize @ticket
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  def update
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    @ticket.destroy
    redirect_to tickets_path
  end

  private
  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :priority)
  end
end
