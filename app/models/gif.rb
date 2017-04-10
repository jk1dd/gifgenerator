class Gif < ApplicationRecord
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  default_scope { order(category_id: :desc)}
end
