class UsersController < ApplicationController
  before_filter :authenticate_user!
    
  def show
    @user = User.find(params[:id])
  end
  
  def welcome
    @character = current_user.character
    
    @photos = @character.get_photos unless @character.photo_url
  end
  
  def update_photo_url
    if current_user.character.update_attributes(:photo_url => params[:photo_url])
      redirect_to root_path
    else
      render "welcome", :error => "There was a problem in saving your preference"
    end
  end
  
end