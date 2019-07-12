class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable, :rememberable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :password_confirmation, presence: true, if: :password
end
