json.array!(@ideas) do |idea|
  json.extract! idea, :id, :name, :description, :completed, :user_id, :published
  json.url idea_url(idea, format: :json)
end
