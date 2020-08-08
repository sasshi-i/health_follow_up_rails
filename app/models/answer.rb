class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :answer_option
  belongs_to :answered_time
  belongs_to :user
end
