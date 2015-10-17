FactoryGirl.define do
  factory :contact do
    name "Ada Lovelace"
    phone "392-193-2930"
    association :user_id, factory: :user
  end
end
