FactoryBot.define do
  factory :answer_content_1_question_numeric_1, class: AnswerContent do
    answer_id { 1 }
    question_id { 1 }
    content { "36.8" }
  end

  factory :answer_content_1_question_text_1, class: AnswerContent do
    answer_id { 1 }
    question_id { 10 }
    content { "hogehoge" }
  end

  factory :answer_content_1_question_option_1, class: AnswerContent do
    answer_id { 1 }
    question_id { 20 }
    answer_option_id { 1 }
  end
end
