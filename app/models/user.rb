class User < ApplicationRecord
  attr_accessor :password_reset

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_one_attached :avatar

  has_many :posts, dependent: :destroy
  has_many :users, through: :posts, source: :book

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  has_many :likes, dependent: :destroy
  has_many :reports, dependent: :destroy

  validates :name, presence: true, length: { maximum: 32 }

  def follow(other_user)
    relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    relationship = relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship # rubocop:disable all
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end
end
