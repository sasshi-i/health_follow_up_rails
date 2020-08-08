FactoryBot.define do
  factory :answer_option_1_question_option_1, class: AnswerOption do
    id { 1 }
    question_id { 20 }
    content { "はい" }
    is_alert { true }
    is_deleted { false }
  end

  factory :answer_option_2_question_option_1, class: AnswerOption do
    id { 2 }
    question_id { 20 }
    content { "いいえ" }
    is_alert { false }
    is_deleted { false }
  end

  factory :answer_option_3_question_option_1, class: AnswerOption do
    id { 3 }
    question_id { 20 }
    content { "不明" }
    is_alert { false }
    is_deleted { false }
  end
end
