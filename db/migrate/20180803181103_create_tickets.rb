class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.belongs_to :user
      t.belongs_to :train

      t.timestamps
    end
    add_column :trains, :busy_place, :integer,  default: 0
  end
end
