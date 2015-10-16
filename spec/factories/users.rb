FactoryGirl.define do
  factory :user do
    email "email@example.com"
    username "user1"
    password "password"
    password_digest "password"
  end
end
