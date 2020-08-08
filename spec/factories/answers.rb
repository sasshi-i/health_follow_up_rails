FactoryBot.define do
  factory :answer_question_numeric_1, class: AnswerOption do
    id { 1 }
    question_id { 20 }
    content { "はい" }
    is_alert { true }
    is_deleted { false }
  end
end
