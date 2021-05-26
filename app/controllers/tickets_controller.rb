class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = current_user.tickets
  end
  
  def show
  end

  def new
    @ticket = current_user.tickets.build(new_ticket_params)
  end

  def create
    @ticket = current_user.tickets.build(ticket_params)
    if @ticket.save
      redirect_to ticket_path(current_user.id, @ticket.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to ticket_path(current_user.id, @ticket.id)
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path(current_user.id, @ticket.id)
  end

  private

  def ticket_params
    params.require(:ticket).permit(:passport_number, :full_name, :train_id, :start_station_id, :end_station_id)
  end

  def new_ticket_params
    params.permit(:train_id, :start_station_id, :end_station_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end