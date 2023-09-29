class Page < ApplicationRecord
  validates :slug, presence: true
  has_many :likes, as: :likeable
end
