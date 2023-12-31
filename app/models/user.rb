class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :tasks
  has_many :likes, dependent: :destroy
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
