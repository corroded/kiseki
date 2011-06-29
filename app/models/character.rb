class Character < ActiveRecord::Base

  DEFAULT_STAT = 5
  ALL_STATS = ['charisma', 'wit', 'stalkability']

  belongs_to :user

  before_create :generate_character

  def generate_rainmaker_stats
    rainmaker_response = Rainmaker.person(user.email)
    
    # for every 10 followers in twitter, +1 charisma
    self.charisma            += bonus_charisma(rainmaker_response.social_profiles)
    
    # for every status message in fb and twitter?
    self.wit                 += bonus_wit(rainmaker_response.social_profiles)
    
    # for every social profile, +1
    self.stalkability        += bonus_stalkability(rainmaker_response)
    
    self.save
    # rainmaker_response
  end

  def bonus_charisma(social_profiles)
    twitter = social_profiles.select{ |sp| sp.type.eql?("twitter") }.first
    begin
      if twitter
        followers_count = Twitter.user(twitter.username).followers_count
        return followers_count < 10 ? 1 : (followers_count/10)
      else
        0
      end
    rescue
      0
    end
  end
  
  def bonus_wit
  end
  
  def bonus_stalkability(response)
    if response 
      social_profile_count(response) + social_photo_count(response)
    else
      -5
    end
  end
  
  private
    def generate_character
      self.charisma = DEFAULT_STAT
      self.wit = DEFAULT_STAT
      self.stalkability = DEFAULT_STAT
    end
    
    def social_profile_count(response)
      begin
        (response.social_profiles && response.social_profiles.count > 1) ? response.social_profiles.count : -1
      rescue
        0
      end
    end
    
    def social_photo_count(response)
      (response.photos && response.photos.count > 1) ? response.photos.count : -1
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

