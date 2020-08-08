class UserRole < ApplicationRecord
  # TODO: バリデーション
  has_many :users
end
