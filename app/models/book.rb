class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }
  belongs_to :user
  has_many :favorites
  has_many :favorites_users, through: :favorites, source: :user
  has_many :comments
end
