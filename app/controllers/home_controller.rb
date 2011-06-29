class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => [:welcome]

  def index
  end
  
  def welcome
    @user = current_user
  end

end
