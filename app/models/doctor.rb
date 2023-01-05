class Doctor < ApplicationRecord
  devise :phone_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :categories

  validates :name, uniqueness: true

  # Validation to ensure that a doctor has at most 10 open records
  validate :validate_open_records_count

  def validate_open_records_count
    if open_records_count > 10
      errors.add(:open_records_count, "cannot be greater than 10")
    end
  end
end