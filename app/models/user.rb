class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  attachment :profile_image

  has_many :favorites, dependent: :destroy
  has_many :favorites_books, through: :favorites, source: :book

  has_many :comments

  def already_favorited?(book)
    self.favorites.exists?(book_id: book.id)
  end
end
