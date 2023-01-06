class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :categories
  has_many :appointments
  has_many :users, through: :appointments

  validates :name, uniqueness: true
  validates :phone, uniqueness: true

  PHONE_NUMBER_REGEX = /\A\d{5,10}\z/

  validates :phone, format: { with: PHONE_NUMBER_REGEX }

  validate :validate_open_records_count

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def validate_open_records_count
    if open_records_count > 10
      errors.add(:open_records_count, "cannot be greater than 10")
    end
  end
end
