class QuestionType < ApplicationRecord
  # TODO: バリデーション
  has_many :questions
end
