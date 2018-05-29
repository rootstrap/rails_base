json.id         message.id
json.content    message.content
json.created_at message.created_at
json.chat_id    message.chat_id
json.sender do
  json.partial! 'api/v1/users/info', user: message.user
end
