class AnswerOption < ApplicationRecord
  belongs_to :question
  has_many :answers
end
