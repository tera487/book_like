class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :password_reset
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
end
