require 'rails_helper'

RSpec.describe ChatChannel, type: :channel do
  let!(:user) { create(:user) }

  describe '.send_message' do
    let!(:chat) do
      create(:chat, :with_messages, user_ids: [user.id])
    end

    it 'successfully subscribes' do
      subscribe(chat_id: chat.id)
      expect(subscription).to be_confirmed
    end

    context 'on a private chat' do
      it 'broadcasts to both users' do
        expect { ChatService.create_message(chat, 'some content', user) }
          .to have_broadcasted_to(chat)
          .from_channel(ChatChannel)
          .with(a_hash_including(content: 'some content'))
      end
    end
  end
end
