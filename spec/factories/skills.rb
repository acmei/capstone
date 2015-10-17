FactoryGirl.define do
  factory :skill do
    category "mindfulness"
    text "wise mind"
    acronym "WM"
    favorite false
    description "This is a description"
    association :user_id, factory: :user
    association :diary_id, factory: :diary
  end

end
