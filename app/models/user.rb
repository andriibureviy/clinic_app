class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, uniqueness: true
  validates :phone, uniqueness: true

  has_many :appointments
  has_many :doctors, through: :appointments

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
