class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.string :phone_number
      t.string :category
      t.text :description
      t.string :url
      t.integer :capacity
      t.integer :rating

      t.timestamps null: false
    end
  end
end
