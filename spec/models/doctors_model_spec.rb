require 'rails_helper'
include FactoryBot::Syntax::Methods

RSpec.describe Doctor, type: :model do
  describe "phone validation" do
    context "when phone is too short" do
      let(:doctor) { build(:doctor, phone: "1234") }

      it "is invalid" do
        expect(doctor).to be_invalid
      end
    end

    context "when phone is too long" do
      let(:doctor) { build(:doctor, phone: "12345678901") }

      it "is invalid" do
        expect(doctor).to be_invalid
      end
    end

    context "when phone is the correct length" do
      let(:doctor) { build(:doctor, phone: "123456789") }

      it "is valid" do
        expect(doctor).to be_valid
      end
    end
  end
end