class Users::TicketsController < ApplicationController
  before_action :get_user
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = @user.tickets
  end

  def show
  end

  def new

    @ticket = @user.tickets.build(new_ticket_params)
  end

  def create
    @ticket = @user.tickets.build(ticket_params)
    byebug


    if @ticket.save
      redirect_to user_ticket_path(@user.id, @ticket.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to user_ticket_path(@user.id, @ticket.id)
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to user_tickets_path(@user.id, @ticket.id)
  end

  private

  def ticket_params
    params.require(:ticket).permit(:passport_number, :full_name, :train_id, :start_station_id, :end_station_id)
  end

  def new_ticket_params
    params.permit(:train_id, :start_station_id, :end_station_id)
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def set_ticket
    @ticket = @user.tickets.find(params[:id])
  end
end