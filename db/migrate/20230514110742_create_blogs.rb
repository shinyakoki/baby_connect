class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|

      # 追加したメモはカレンダーの中に表示させたいため下記カラムを追加
      t.string :title
      t.text :content
      t.datetime :start_time
      # ここまで
      t.timestamps
    end
  end
end
