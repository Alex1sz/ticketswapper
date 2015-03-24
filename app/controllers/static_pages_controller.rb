class StaticPagesController < ApplicationController
  def home
  end

  def search
    if params[:query].blank?
      flash[:notice] = "Please supply a search term"
    else
      @ticket_results = Ticket.search_ticket(params[:query])
      if @ticket_results.nil?
        flash[:notice] = "No results found"
      else
        @search = @ticket_results
      end
    end
  end
end
