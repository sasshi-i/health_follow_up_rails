FactoryBot.define do
  factory :question_type_input_numeric, class: QuestionType do
    id { 1 }
    name { "numeric" }
  end

  factory :question_type_input_text, class: QuestionType do
    id { 2 }
    name { "text" }
  end

  factory :question_type_input_option, class: QuestionType do
    id { 3 }
    name { "option" }
  end
end
