class DoctorsController < ApplicationController
  before_action :set_appointment, only: [:update]
  before_action :set_doctor, only: [:show, :appointments, :update]

  def appointments
    @appointments = current_doctor.appointments
  end

  def show
  end

  def index
    if params[:category_id].present?
      @doctors = Doctor.joins(:categories).where(categories: { id: params[:category_id] })
    else
      @doctors = Doctor.all
    end
  end

  def update
    if params[:appointment].present?
      if @appointment.update(appointment_params)
        redirect_to doctor_appointments_path(@doctor)
      else
        render :appointments
      end
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def set_appointment
    @appointment = @doctor.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:recommendation)
  end
end
