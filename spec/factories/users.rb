FactoryGirl.define do
  factory :user do |user|
    user.sequence(:name) { |n| "user#{n}" }
    user.sequence(:email) { |n| "email#{n}@example.com"}
    user.session_day "Monday"
    user.uid "random"
    user.provider "google_oauth2"
    user.password "password"
    user.password_digest "password"
    user.remember_digest "remember"
    user.activation_digest "active"
    user.activated false
    user.activated_at "2015-10-21 21:35:07"
    user.photo nil
    user.therapist nil
    user.reset_token "random"
  end
end
