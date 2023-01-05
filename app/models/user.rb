class User < ApplicationRecord
  devise :phone_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, uniqueness: true
end
