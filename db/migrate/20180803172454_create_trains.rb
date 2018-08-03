class CreateTrains < ActiveRecord::Migration[5.2]
  def change
    create_table :trains do |t|
      t.integer :place
      t.string :first_name_station
      t.string :last_name_station
      t.timestamps
    end
  end
end
