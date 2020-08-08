class AnswerOption < ApplicationRecord
  # TODO: バリデーション
  belongs_to :question
  has_many :answers
end
