require 'rails_helper'

describe ChatService do
  let(:user) { create(:user) }
  let(:chat) { create(:chat) }
  let(:participant) { create(:participant, user: user, chat: chat) }

  it 'update connected user' do
    t = DateTime.now
    TimeCop.freeze(t) do
      expect { ChatService.user_conected(user, chat) }.to
      change(participant.last_connection).from(nil).to(t)
    end
  end

  it 'create a message' do
    messages = Message.count
    expect { ChatService.send_message(chat, 'hello', user) }.to change(messages).by(1)
  end
end
