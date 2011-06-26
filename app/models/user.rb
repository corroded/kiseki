class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :character
         
  # validates_presence_of :login
  validates_uniqueness_of :email, :case_sensitive => false

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  after_create :generate_character
  
  private
    def generate_character
      self.create_character(:name => "#{email}'s avatar")
    end
  
end
