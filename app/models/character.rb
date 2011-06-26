class Character < ActiveRecord::Base
  
  belongs_to :user
  
  after_create :generate_character
  
  private
    def generate_character
      puts "MY USER'S EMAIL: #{self.user.email}"
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

