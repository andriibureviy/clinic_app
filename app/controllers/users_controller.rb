class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def view_doctors
    @categories = Category.all

    if params[:category_id].present?
      @doctors = Doctor.joins(:categories).where(categories: { id: params[:category_id] })
    else
      @doctors = Doctor.all
    end
  end

  def make_appointment
    @appointment = Appointment.new
    # @doctor = Doctor.find(params[:doctor_id])
    # @appointment = Appointment.create(user: current_user, doctor: @doctor)
  end

  def view_recommendation
    @appointment = Appointment.find(params[:appointment_id])
    @recommendation = @appointment.recommendation
  end
end