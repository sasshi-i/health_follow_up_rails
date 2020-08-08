class AnsweredTime < ApplicationRecord
  belongs_to :answer
  belongs_to :answer_comment
end
