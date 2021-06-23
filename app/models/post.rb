class Post < ApplicationRecord
  belongs_to :user
  belongs_to :book, primary_key: "isbn"

  has_many :reports, dependent: :destroy

  # validates :, presence: true
  
end
