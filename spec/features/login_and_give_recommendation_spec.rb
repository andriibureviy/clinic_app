# require 'rails_helper'
#
# RSpec.describe "Doctor gives recommendation for user", type: :features  do
#   before do
#     # Setup code, such as creating a doctor and user and making an appointment
#   end
#
#   it "allows the doctor to give a recommendation for the user" do
#     # Login as the doctor
#     visit doctor_path
#     fill_in "Email", with: doctor.email
#     fill_in "Password", with: doctor.password
#     click_button "Log in"
#
#     # Navigate to the appointment show page
#     visit doctor_appointment_path(doctor, appointment)
#
#     # Fill in the recommendation form and submit it
#     fill_in "Recommendation", with: "Take two aspirin and call me in the morning."
#     click_button "Save Recommendation"
#
#     # Expect the recommendation to be displayed on the page
#     expect(page).to have_content "Take two aspirin and call me in the morning."
#   end
# end

# spec/static_spec.rb

require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  before do
    build(:doctor)

  end

  it 'shows the static text' do
    visit doctors_path
    fill_in "Phone", with: "7860945310"
    fill_in "Name", with: "John"
    fill_in "Password", with: "12334123"
    click_button "Log in"
    click_button "Log in"
    click_button "Log in"

    sleep(5)
  end
end

