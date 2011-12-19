class DungeonsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @teams = @current_user.teams
  end
  
  def show
    
  end
  
end
