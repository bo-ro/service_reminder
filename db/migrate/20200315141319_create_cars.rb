class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :plate_number
      t.string :telephone_number
      t.date :last_serviced_at
      t.string :client_first_name
      t.string :client_last_name
      t.timestamps
    end
    add_index :cars, :plate_number
    add_index :cars, :last_serviced_at
  end
end
