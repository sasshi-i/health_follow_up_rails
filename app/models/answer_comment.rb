class AnswerComment < ApplicationRecord
  # TODO: バリデーション
  belongs_to :answer
  belongs_to :user
end
