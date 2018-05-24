json.chats do
  json.array! @chats, partial: 'info', as: :chat
end
