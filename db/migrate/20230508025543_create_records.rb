class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :content, null: false
      t.datetime :date, null: false
      t.references :baby, null: false, foreign_key: true
      t.timestamps
    end
  end
end
