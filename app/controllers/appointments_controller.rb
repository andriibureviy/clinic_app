class AppointmentsController < ApplicationController
  def index
    @appointments = current_user.appointments
  end

  def show
    @appointment = Appointment.find(params[:id])
    @doctor = @appointment.doctor
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id
    if @appointment.save
      redirect_to appointments_path, notice: "Appointment created successfully."
    else
      render :make_appointment
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to doctor_appointment_path(@appointment.doctor, @appointment)
    else
      render :show
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :user_id, :date_time, :recommendation)
  end
end