class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :adress
      t.string :country
      t.string :city
      t.string :name
      t.integer :nb_beds
      t.integer :nb_bath
      t.integer :price

      t.timestamps
    end
  end
end
