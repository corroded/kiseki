require 'spec_helper'

describe Character do
  DEFAULT_STAT = 5
  
  before(:each) do
    @user = Factory(:user)
    @character = @user.character
  end
  
  describe "user character" do
    it "should have a default name: email's avatar" do
      @character.name.should == "#{@user.email}'s avatar"
    end

    it "should have default stats" do
      @character.hp.should == DEFAULT_STAT &&
      @character.magic.should == DEFAULT_STAT &&
      @character.dexterity.should == DEFAULT_STAT &&
      @character.strength.should == DEFAULT_STAT &&
      @character.charisma.should == DEFAULT_STAT &&
      @character.intelligence.should == DEFAULT_STAT &&
      @character.defense.should == DEFAULT_STAT
    end

  end
  
  describe "character augmented stats" do
    it "should get augmented stats after create" do
    end
  end
end