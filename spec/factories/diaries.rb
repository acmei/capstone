FactoryGirl.define do
  factory :diary do
    filled_in_session false
    times_filled 1
    association :user_id, factory: :user
  end
end
