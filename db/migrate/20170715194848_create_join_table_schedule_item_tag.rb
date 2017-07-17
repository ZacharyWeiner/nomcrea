class CreateJoinTableScheduleItemTag < ActiveRecord::Migration[5.1]
  def change
    create_join_table :schedule_items, :tags do |t|
      t.index [:schedule_item_id, :tag_id]
    end 
  end
end
