class CreateScheduleItems < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_items do |t|
      t.string :item_type
      t.date :start_date
      t.date :end_date
      t.references :tag, foreign_key: true
      t.references :schedule, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
