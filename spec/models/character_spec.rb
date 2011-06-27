require 'spec_helper'

describe Character do  
  before(:each) do
    @user = Factory(:user)
    @character = @user.character
  end
  
  describe "user character" do
    it "should have a default name: email's avatar" do
      @character.name.should == "#{@user.email}'s avatar"
    end

    it "should have default stats" do
      Character::ALL_STATS.each do |stat|
        @character.send(stat.to_sym).should == Character::DEFAULT_STAT
      end
    end

  end
end