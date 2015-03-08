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
    @ticket = Ticket.build(ticket_params)

    if @ticket.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def ticket_params 
    params.require(:ticket).permit(:event, :date, :quantity, :section, :row, :venue, :location)
  end
end
