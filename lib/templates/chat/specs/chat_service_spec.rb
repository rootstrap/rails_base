require 'rails_helper'

describe ChatService do
  let!(:user) { create(:user) }
  let!(:chat) { create(:chat) }
  let!(:participant) { create(:participant, user: user, chat: chat) }

  describe '.create_message' do
    it 'creates a message' do
      expect do
        ChatService.create_message(chat, 'hello', user)
      end.to change(Message, :count).by(1)
    end

    it 'returns a message' do
      expect(ChatService.create_message(chat, 'hello', user)).to be_a(Message)
    end
  end
end
