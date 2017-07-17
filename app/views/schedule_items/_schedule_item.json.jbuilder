json.extract! schedule_item, :id, :item_type, :start_date, :end_date, :tag_id, :schedule_id, :title, :created_at, :updated_at
json.url schedule_item_url(schedule_item, format: :json)
