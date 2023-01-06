class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  # validate :appointment_date_is_in_the_future

  private

  def appointment_date_is_in_the_future
    if appointment.date_time.present? && appointment.date_time < Date.today
      errors.add(:appointment_date, "must be in the future")
    end
  end
end