class User::UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
  end
  
  def welcome
    @user = current_user
    @character = current_user.character
  end
  
end