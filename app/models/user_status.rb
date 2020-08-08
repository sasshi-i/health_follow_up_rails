class UserStatus < ApplicationRecord
  # TODO: バリデーション
  has_many :users
end
