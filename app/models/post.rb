class Post < ApplicationRecord
  has_one_attached :image
  has_many_attached :images

  has_many :comments
  has_many :likes, as: :likable, dependent: :destroy

  belongs_to :user
  validates :title, presence: true

end
