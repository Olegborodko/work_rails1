class User < ActiveRecord::Base
   attr_accessible :last_name,:first_name,
  :email,:password,:information, :password_confirmation

  attr_accessor :password_confirmation

  validates :last_name,:first_name,
  :email,:password, :presence => true

  validates :email, uniqueness: true

  #before_save :mm



end
