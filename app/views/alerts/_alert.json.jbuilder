json.extract! alert, :id, :type, :name, :tag, :description, :origin, :task_id, :created_at, :updated_at
json.url alert_url(alert, format: :json)
