class Answer < ApplicationRecord
  # TODO: バリデーション
  belongs_to :answer_comment
  belongs_to :user
  has_many :answer_contents
end
