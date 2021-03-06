json.array!(@chat_messages) do |chat_message|
  json.extract! chat_message, :id, :body, :user_id
  json.url chat_message_url(chat_message, format: :json)
end
