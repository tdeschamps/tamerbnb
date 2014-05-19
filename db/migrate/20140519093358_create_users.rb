class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :user_name
      t.date :birth_date
      t.text :bio
      t.tring :password
      t.string :profile_picture

      t.timestamps
    end
  end
end
