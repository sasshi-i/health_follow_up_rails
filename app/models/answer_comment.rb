class AnswerComment < ApplicationRecord
  # TODO: バリデーション
  has_one :answer
  belongs_to :user
end
