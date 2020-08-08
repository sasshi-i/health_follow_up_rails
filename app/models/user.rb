class User < ApplicationRecord
  has_secure_password

  # TODO: バリデーション
  belongs_to :prefecture
  belongs_to :user_status
  has_many :referral_hospitals
  has_many :answers
  has_many :answer_comments
end
