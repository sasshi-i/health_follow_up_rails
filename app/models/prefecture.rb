class Prefecture < ApplicationRecord
  validates :name,
            presence: true

  validates :display_order,
            presence: true

  has_many :users
end
