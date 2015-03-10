class TicketsController < ApplicationController

  def show
    @ticket = Ticket.find(params[:id])
  end

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:success] = "Succesfully added your listing!"
      redirect_to @ticket
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @ticket.update_attributes(user_params)
      flash[:success] = "Listing Updated"
      redirect_to @ticket
    else
      render 'edit'
    end
  end

  private

  def ticket_params 
    params.require(:ticket).permit(:event, :date, :quantity, :location, :description, :email)
  end
end
