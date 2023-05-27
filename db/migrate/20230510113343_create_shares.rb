class CreateShares < ActiveRecord::Migration[6.1]
  def change
    create_table :shares do |t|
      #t.references :baby, null: false, foreign_key: true
      # t.references :parent, null: false, foreign_key: true
      t.timestamps
    end
  end
end
