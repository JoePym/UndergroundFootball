class TeamsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @teams = @current_user.teams
  end
  
  def show
    
  end
  
  def new
    
  end
  
  def create
    
  end
end
