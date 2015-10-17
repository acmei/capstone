FactoryGirl.define do
  factory :user do |user|
    user.sequence(:email) { |n| "email#{n}@example.com"}
    user.sequence(:username) { |n| "user#{n}" }
    user.password "password"
    user.password_digest "password"
  end
end
