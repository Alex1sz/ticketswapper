class TicketsController < ApplicationController
  require 'will_paginate/array'
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :redirect_if_not_ticket_creator!, except: [ :index, :show, :new, :create ]

  def show
    @ticket = Ticket.find(params[:id])
  end

  def index
    @tickets = Ticket.all.reverse.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.build(ticket_params)

    if @ticket.save
      flash[:success] = 'Succesfully added your listing!'
      redirect_to @ticket
    else
      render 'new'
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    ticket = Ticket.find(params[:id])

    if ticket.update_attributes(ticket_params)
      flash[:success] = 'Listing Updated'
      redirect_to ticket
    else
      render 'edit'
    end
  end

  private

  def ticket_params 
    params.require(:ticket).permit(:event, :date, :quantity, :location, :description, :email)
  end

  def redirect_if_not_ticket_creator!
    redirect_to root_path unless Ticket.find(params[:id]).created_by?(current_user)
  end
end
