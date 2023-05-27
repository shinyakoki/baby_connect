class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.boolean :checked, default: false
      # t.references :calendar, null: false, foreign_key: true
      # t.references :visiter, null: false, foreign_key: true
      # t.references :visited, null: false, foreign_key: true
      t.timestamps
    end
  end
end
