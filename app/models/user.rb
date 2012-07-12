class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable


  devise :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body

  validates :username, :uniqueness => true, :length => { :within => 4..24}

 def self.find_for_instagram_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
   
    logger.debug access_token.info.nickname
    if user = User.where(:username => data.nickname).first
      user
    #else # Create a user with a stub password. 
      #User.create!(:email => data.email, :password => Devise.friendly_token[0,20], :firstname => "stub", :lastname => "stub") 
    end
  end

  def email_required?
    false
  end


end
