require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory(:user)
  end
  
  describe "User and character creation" do
    it "should have an email of 'imacaterpillar@gmail.com'" do
      @user.email.should == "imacaterpillar@gmail.com"
    end
  
    it "should have a character with name 'imacaterpillar@gmail.com's avatar'" do
      @user.character.name == "imacaterpillar@gmail.com's avatar"
    end
  end
end
