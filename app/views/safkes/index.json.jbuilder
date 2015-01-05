json.array!(@safkes) do |safke|
  json.extract! safke, :id, :user_id
  json.url safke_url(safke, format: :json)
end
