class AnswerContent < ApplicationRecord
  # TODO: バリデーション
  belongs_to :answer
  belongs_to :answer_option, optional: true
  belongs_to :question
end
