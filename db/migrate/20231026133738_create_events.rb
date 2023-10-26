class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      # イベント名
      t.string :title
      # 内容
      t.text :content
      # 投稿内容をカレンダーに反映させる
      t.datetime :start_time

      t.timestamps
    end
  end
end
