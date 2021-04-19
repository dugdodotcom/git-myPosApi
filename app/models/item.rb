class Item < ApplicationRecord
  extend FriendlyId

  belongs_to :category
  belongs_to :user
  has_many :galleries
  friendly_id :name, use: :slugged
end
