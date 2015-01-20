class User < ActiveRecord::Base
  require "./lib/Mymodule.rb"
  include My_M

   attr_accessible :last_name,:first_name,
  :email,:password,:information,:password_confirmation

  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  attr_accessor :password

  validates :last_name,:first_name,
  :email, :presence => true

  validates :email, :format => {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, :uniqueness => true

  before_save :encrypt_password


end
