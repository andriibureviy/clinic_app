require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let!(:doctor) { create(:doctor) }
  let!(:user) { create(:user) }
  let!(:appointment) { create(:appointment, user: user, doctor: doctor) }

  before do
    sign_in user
  end

  describe "GET #index" do
    subject { get :index }

    it "renders the index template" do
      subject
      expect(response).to render_template :index
    end

    it "assigns the current user's appointments to @appointments" do
      subject
      expect(assigns(:appointments)).to match_array appointment
    end
  end

  describe "PATCH #update" do
    let(:valid_params) { { recommendation: "Take two pills a day" } }

    it "updates the recommendation of the appointment" do
      patch :update, params: { id: appointment.id, appointment: valid_params }
      expect(appointment.reload.recommendation).to eq "Take two pills a day"
    end
  end

  describe "GET #show" do
    subject { get :show, params: { id: appointment.id } }

    it "renders the show template" do
      subject
      expect(response).to render_template :show
    end

    it "assigns the requested appointment to @appointment" do
      subject
      expect(assigns(:appointment)).to eq appointment
    end

    it "assigns the doctor of the requested appointment to @doctor" do
      subject
      expect(assigns(:doctor)).to eq appointment.doctor
    end
  end
end
