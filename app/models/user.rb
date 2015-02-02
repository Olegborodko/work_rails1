class User < ActiveRecord::Base
  include My_M

  self.per_page = 2

   attr_accessible :last_name,:first_name,
  :email,:password,:information,
  :password_confirmation, :secret, :password_change

  attr_accessor :password, :secret, :password_change

  validates :last_name,:first_name,
  :email, :presence => true

  validates :email, :format => {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, :uniqueness => true

  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :password, confirmation: true, on: :update, if: "password"
  validates :password_confirmation, presence: true, on: :update, if: "password"
  
  validates :secret, presence: true, on: :create
  
  before_save :encrypt_password, on: :create 
  before_save :encrypt_secret_word, on: :create

    def encrypt_secret_word
      if secret.present? 
        self.secret_word_salt = BCrypt::Engine.generate_salt
        self.secret_word = BCrypt::Engine.hash_secret(secret, secret_word_salt)
      end
    end

    def secret_word?(secret)

        if self.secret_word == BCrypt::Engine.hash_secret(secret, self.secret_word_salt)
          true
        else
          false
        end
    end

end