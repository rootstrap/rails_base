class ChatChannel < ApplicationCable::Channel
  def subscribed
    chat = Chat.find(params[:chat_id])
    stream_for(chat)
  end

  def unsubscribed; end

  def send_message(data)
    content = data['message']
    chat_id = data['chat_id']
    chat = Chat.find(chat_id)
    ChatService.create_message(chat, content, current_user)
  end
end
