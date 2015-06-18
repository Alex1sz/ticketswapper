class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @tickets = current_user.tickets.all
  end
end
