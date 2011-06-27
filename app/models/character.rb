class Character < ActiveRecord::Base

  DEFAULT_STAT = 5
  ALL_STATS = ['charisma', 'wit', 'stalkability']

  belongs_to :user

  before_create :generate_character

  def generate_rainmaker_stats
    rainmaker_response = Rainmaker.person(user.email)
    
    # for every 100 followers in twitter, +1 charisma
    self.charisma            += bonus_charisma(rainmaker_response.social_profiles)
    self.wit                 += bonus_wit(rainmaker_response.social_profiles)
    self.stalkability        += bonus_stalkability(rainmaker_response.social_profiles)
    
    self.save
    # rainmaker_response
  end

  def bonus_charisma(social_profiles)
    twitter = social_profiles.select{ |sp| sp.type.eql?("twitter") }.first
    begin
      if twitter
        followers_count = Twitter.user(twitter.username).followers_count
        return followers_count < 100 ? 1 : (followers_count/100)
      end
    rescue
      0
    end
  end
  
  def bonus_wit
    
  end
  
  def bonus_stalkability
    
  end
  
  private
    def generate_character
      self.charisma = DEFAULT_STAT
      self.wit = DEFAULT_STAT
      self.stalkability = DEFAULT_STAT
    end

end

# == Schema Information
#
# Table name: characters
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  type_id      :integer
#  hp           :integer
#  strength     :integer
#  magic        :integer
#  dexterity    :integer
#  charisma     :integer
#  intelligence :integer
#  stalkability      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

