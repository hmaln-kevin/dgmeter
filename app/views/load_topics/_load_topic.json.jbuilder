json.extract! load_topic, :id, :description, :pin, :created_at, :updated_at
json.url load_topic_url(load_topic, format: :json)
