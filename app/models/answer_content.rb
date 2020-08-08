class AnsweredContent < ApplicationRecord
  # TODO: バリデーション
  belongs_to :answer
  belongs_to :answer_option
  belongs_to :question
end
