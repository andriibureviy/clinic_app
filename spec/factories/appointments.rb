FactoryBot.define do
  factory :appointment do
    doctor_id { 1 }
    user_id { 1 }
    date_time { '2020-10-10 10:10:10' }
    recommendation { 'MyText' }
  end
end
