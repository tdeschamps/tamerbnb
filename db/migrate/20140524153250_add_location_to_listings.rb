class AddLocationToListings < ActiveRecord::Migration
  def change
    change_table :listings do |t|
      t.float :latitude
      t.float :longitude
    end
  end
end
