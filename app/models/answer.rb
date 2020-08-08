class Answer < ApplicationRecord
  # TODO: バリデーション
  belongs_to :question
  belongs_to :answer_option
  belongs_to :answered_time
  belongs_to :user
end
