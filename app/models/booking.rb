class Booking < ApplicationRecord
  belongs_to :item

  validates :user,       presence: :true
  validates :start_date, presence: :true
  validates :end_date,   presence: :true
end
