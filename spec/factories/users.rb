FactoryGirl.define do
  factory :user do
    email "email@email.com"
    username "user1"
    password "password"
    password_digest "password"
  end
end
