class Character < ActiveRecord::Base
  
  belongs_to :user
  
  after_create :generate_character
  
  private
    def generate_character
      puts "MY USER'S EMAIL: #{self.user.email}"
    end
end
