class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :user
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
