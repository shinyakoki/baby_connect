class CreateBabies < ActiveRecord::Migration[6.1]
  def change
    create_table :babies do |t|
      t.string :nickname, null: false
      t.integer :sex, null: false
      t.date :date_of_birth, null: false
      t.string :share_code, null: false
      t.datetime :share_code_datetime, null: false
      t.timestamps
    end
  end
end
