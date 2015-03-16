class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def correct_user
    user = Ticket.find(params[:id]).user if params[:id]
    redirect_to root_path unless current_user == user
  end
end
