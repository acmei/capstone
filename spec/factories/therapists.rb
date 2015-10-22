FactoryGirl.define do
  factory :therapist do
    username "username"
    name "Dr. Fox Mulder"
    email "email@email.com"
    phone "420 392 4838"
    password "password"
    password_digest "password"
    association :photo_id, factory: :photo
  end
end
