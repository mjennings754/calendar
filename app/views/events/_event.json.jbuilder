json.extract! event, :id, :schedule_id, :title, :description, :start_time, :end_time, :created_at, :updated_at
json.url event_url(event, format: :json)
