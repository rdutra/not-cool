json.extract! complaint, :id, :subject, :body, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)
