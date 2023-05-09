class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.string :comment, null: false
      t.date :start_time, null: false
      t.date :end_time, null: false
      t.references :baby, null: false, foreign_key: true
      t.timestamps
    end
  end
end
