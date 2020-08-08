class Answer < ApplicationRecord
  # TODO: バリデーション
  has_one :answer_comment
  belongs_to :user
  has_many :answer_contents
end
