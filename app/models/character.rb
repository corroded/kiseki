class Character < ActiveRecord::Base

  DEFAULT_STAT = 5
  ALL_STATS = ['hp', 'magic', 'dexterity', 'strength', 'charisma', 'wit', 'defense']

  belongs_to :user

  before_create :generate_character


  def generate_rainmaker_stats
    rainmaker_response = Rainmaker.person(user.email)
    
    # for every 100 followers in twitter, +1 charisma
    self.charisma += bonus_charisma(rainmaker_response.social_profiles)

    rainmaker_response
  end

  def bonus_charisma(social_profiles)
    twitter = social_profiles.select{ |sp| sp.type.eql?("twitter") }.first
    puts "has twitter? #{twitter}"
    begin
      if twitter
        followers_count = Twitter.user(twitter.username).followers_count
        puts "followers count #{followers_count} and total #{followers_count/100}"
        return followers_count < 100 ? 1 : (followers_count/100)
      end
    rescue
      0
    end
  end
  
  private
    def generate_character
      self.hp = DEFAULT_STAT
      self.strength = DEFAULT_STAT
      self.magic = DEFAULT_STAT
      self.dexterity = DEFAULT_STAT
      self.charisma = DEFAULT_STAT
      self.wit = DEFAULT_STAT
      self.defense = DEFAULT_STAT
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
#  defense      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

