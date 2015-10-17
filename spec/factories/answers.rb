FactoryGirl.define do
  factory :answer do
    num_val 1
    text_val "text is here"
    bool_val false
    association :user_id, factory: :user
    association :question_id, factory: :question
  end
end
