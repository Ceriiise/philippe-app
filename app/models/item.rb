class Item < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, presence: :true
  validates :description, presence: :true
end
