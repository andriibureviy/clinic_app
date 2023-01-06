class DoctorsController < ApplicationController
  def appointments
    @appointments = current_doctor.appointments
  end

  def show
  end

  def index
    if params[:category].present?
      @doctors = Category.find(params[:category]).doctors
    else
      @doctors = Doctor.all
    end
  end


  def update
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = @doctor.appointments.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to doctor_appointments_path(@doctor)
    else
      render :appointments
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:recommendation)
  end
end

