class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_for Chat.find(params[:chat_id])
  end

  # TODO: => UNSUSCRIBE ???

  def send_message(data)
    content = data['content']
    room = infer_chat_type
    ChatService.create_message room, content, current_user
    self.class.broadcast_to room.name, message(content)
  end

  def user_conected(chat, user)
    ChatService.user_conected(chat, user)
  end

  private

  def message(content)
    {
      content: content,
      action: 'new_message',
      user: current_user.username,
      user_id: current_user.id,
      date: Time.zone.now.iso8601
    }
  end
end
