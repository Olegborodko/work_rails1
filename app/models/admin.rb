class Admin < ActiveRecord::Base


 attr_accessible :last_name,:first_name,
  :email,:password,:information,:password_confirmation

  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  attr_accessor :password

  validates :last_name,:first_name,
  :email, :presence => true

  validates :email, :format => {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, :uniqueness => true

  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end



	def self.authenticate(email, password)
	  user = find_by_email(email)
	  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
	    user
	  else
	    nil
	  end
	end



end
