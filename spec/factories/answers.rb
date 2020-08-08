FactoryBot.define do
  factory :answer_1_user_1, class: Answer do
    id { 1 }
    user_id { 1 }
    is_deleted { false }
  end
end
