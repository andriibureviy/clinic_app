class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :view_doctors, :make_appointment, :view_recommendation]

  def show
    @user = User.find(params[:id])
  end

  def view_doctors
    if params[:category_id].present?
      @doctors = Doctor.joins(:categories).where(categories: { id: params[:category_id] })
    else
      @doctors = Doctor.all
    end
  end

  def make_appointment
    @appointment = Appointment.new
  end

  def view_recommendation
    @appointment = Appointment.find(params[:appointment_id])
    @recommendation = @appointment.recommendation
  end
end
