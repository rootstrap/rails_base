module ChatService
  def create_message(chat, content, user)
    message = user.messages.create!(chat: chat, content: content)
    chat.messages << message
    chat.save!
    broadcast_message(chat, message)
    message
  end
  module_function :create_message

  def broadcast_message(chat, message)
    message_data = form_message_data(message)
    ChatChannel.broadcast_to(chat, message_data)
  end

  def form_message_data(message)
    user = message.user
    {
      action: 'new_message',
      content: message.content,
      user: user.username,
      user_id: user.id,
      date: Time.zone.now.iso8601
    }
  end
end
