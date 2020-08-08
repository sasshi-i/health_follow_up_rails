class AnsweredTime < ApplicationRecord
  # TODO: バリデーション
  belongs_to :answer
  belongs_to :answer_comment
end
