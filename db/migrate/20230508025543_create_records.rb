class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer :item
      t.integer :unit
      t.integer :amount
      t.datetime :date, null: false
      t.integer :baby_id, null: false
      t.timestamps
    end
  end
end
