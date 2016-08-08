class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.integer :reference
      t.string :address
      t.integer :zip_code
      t.string :city
      t.string :country
      t.string :manager_name

      t.timestamps null: false
    end
  end
end
