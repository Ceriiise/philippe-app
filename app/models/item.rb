class Item < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, presence: :true
  validates :description, presence: :true
end
