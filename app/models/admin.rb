class Admin < ActiveRecord::Base

  include My_M

  belongs_to :role
  has_many :pictures, as: :user, dependent: :destroy

 # attr_accessible :last_name,:first_name,
 # :email,:password,:information,:password_confirmation

  attr_accessor :password

  validates :last_name,:first_name,
  :email, :presence => true

  validates :email, :format => {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, :uniqueness => true

  
    validates :password, confirmation: true, on: :create 
    validates :password_confirmation, presence: true, on: :create 

    before_save :encrypt_password, on: :create 



end
