require 'rails_helper'

describe Message do
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }
  let(:chat) { create(:chat) }
  let(:participant) { create(:participant, user: user_1, chat: chat) }

  describe 'validates restrictions' do
    it 'have a content' do
      subject build(:message, user: user_1, chat: chat)
      it { validate_presence_of(:content) }
    end
  end

  describe 'validates last_message is updated' do
    it 'be set for first time' do
      new_message = 'next message'
      expect(create(:message, user: user_1, chat: chat, content: new_message)).to
      change(:participant.last_message).from(nil).to(new_message)
    end

    it 'change when new message' do
      last_message = Message.last.pluck(:last_message)
      new_message = 'next message'
      expect(create(:message, user: user_1, chat: chat, content: new_message)).to
      change(:participant.last_message).from(last_message).to(new_message)
    end
  end

  describe 'validates user registered for chat' do
    it 'allow user to send message' do
      expect(build(:message, user: user_1, chat: chat)).to have(0).errors_on(:message)
    end

    it 'not allow user to send message' do
      expect(build(:message, user: user_2, chat: chat)).to have(1).errors_on(:message)
    end
  end
end
