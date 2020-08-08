FactoryBot.define do
  factory :question_numeric_1, class: Question do
    id { 1 }
    content { "体温" }
    question_type_id { 1 }
    is_deleted { false }
  end

  factory :question_text_1, class: Question do
    id { 10 }
    content { "その他の症状" }
    question_type_id { 2 }
    is_deleted { false }
  end

  factory :question_option_1, class: Question do
    id { 20 }
    content { "［表情・外見］\n★顔色が明らかに悪い\n★唇が紫色になっている\n★いつもと違う、様子がおかしい" }
    question_type_id { 3 }
    is_deleted { false }
  end
end
