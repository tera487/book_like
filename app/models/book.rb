class Book < ApplicationRecord
  has_many :posts, dependent: :destroy
  # has_many :posts_users, through: :posts, source: :user
end
