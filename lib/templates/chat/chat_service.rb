class ChatService
  def self.create_message(chat, message, user)
    # TODO: FIND A WAY TO SEE WHAT TYPE OF MESSAGE IT IS O_o
    Message.create!(chat: chat, content: message, user: user)
  end
end
