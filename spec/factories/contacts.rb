FactoryGirl.define do
  factory :contact do
    name "Ada Lovelace"
    phone "937.893.2930"
    association :user_id, factory: :user
  end
end
