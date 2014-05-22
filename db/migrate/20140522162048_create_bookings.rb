class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :listing_id, index: true
      t.references :user_id, index: true
      t.date :begin_date
      t.date :end_date
      t.integer :price

      t.timestamps
    end
  end
end
