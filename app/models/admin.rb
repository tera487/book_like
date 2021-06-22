class Admin < ApplicationRecord
  attr_accessor :password_reset
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:timeoutable

  has_many :articles, dependent: :destroy
  
end
