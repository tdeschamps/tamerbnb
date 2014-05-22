class AddDescriptionToListings < ActiveRecord::Migration
  def change
    change_table :listings do |t|
      t.text :description, default: Faker::Company.catch_phrase
    end
  end
end
