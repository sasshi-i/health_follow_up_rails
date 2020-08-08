class Question < ApplicationRecord
  belongs_to :question_type
  has_many :answers
  has_many :answer_options
end
