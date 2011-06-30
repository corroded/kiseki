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
        @character.send(stat.to_sym).should == Character::BASE_STAT
      end
    end
  end

  describe "generate rainmaker stats" do
    it "should modify stats depending on rainmaker results" do
      #fake bonus
      rainmaker_bonus = 3

      #fake API call
      Rainmaker.stub_chain(:person, :social_profiles)

      #stub the methods
      Character::ALL_STATS.each do |stat|
        @character.stub("bonus_#{stat}".to_sym).and_return(rainmaker_bonus)
      end

      @character.generate_rainmaker_stats

      Character::ALL_STATS.each do |stat|
        @character.send(stat.to_sym).should == Character::BASE_STAT + rainmaker_bonus
      end
    end
  end
end

# == Schema Information
#
# Table name: characters
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  type_id      :integer
#  charisma     :integer
#  wit          :integer
#  stalkability :integer
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

