class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :listing, index: true
      t.references :user, index: true
      t.date :begin_date
      t.date :end_date
      t.integer :price

      t.timestamps
    end
  end
end
