class AnswerComment < ApplicationRecord
  has_one :answered_time
  belongs_to :user
end
