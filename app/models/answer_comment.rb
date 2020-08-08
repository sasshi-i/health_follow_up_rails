class AnswerComment < ApplicationRecord
  # TODO: バリデーション
  has_one :answered_time
  belongs_to :user
end
