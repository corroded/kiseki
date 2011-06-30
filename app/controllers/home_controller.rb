class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => [:welcome]

  def index
    if current_user
      redirect_to welcome_path
    end
  end
  
end
