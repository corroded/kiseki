require 'spec_helper'

describe Character do
  DEFAULT_STAT = 5
  
  before(:each) do
    @user = Factory(:user)
    @character = @user.character
  end
  
  describe "user gievs email address" do
    it "should create a character with default name: email's avatar" do
      @character.name.should == "#{@user.email}'s avatar"
    end

    it "should generate a character with default stats" do
      @character.hp.should == DEFAULT_STAT &&
      @character.magic.should == DEFAULT_STAT &&
      @character.dexterity.should == DEFAULT_STAT &&
      @character.strength.should == DEFAULT_STAT &&
      @character.charisma.should == DEFAULT_STAT &&
      @character.intelligence.should == DEFAULT_STAT &&
      @character.defense.should == DEFAULT_STAT
    end
  end
end