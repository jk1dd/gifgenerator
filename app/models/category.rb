class Category < ApplicationRecord
  has_many :gifs, dependent: :destroy
end
