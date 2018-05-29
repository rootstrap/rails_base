require 'spec_helper'
require 'rails_helper'

class TestConnection
  attr_reader :identifiers, :logger

  def initialize(identifiers_hash = {})
    @identifiers = identifiers_hash.keys
    @logger = ActiveSupport::TaggedLogging.new(
      ActiveSupport::Logger.new(StringIO.new)
    )

    identifiers_hash.each do |identifier, value|
      define_singleton_method(identifier) do
        value
      end
    end
  end
end

RSpec.describe ChatChannel do
  let!(:user) { create(:user) }
  let(:connection) { TestConnection.new(current_user: user) }
  subject(:channel) { described_class.new(connection, {}) }
  let(:chat_cable) { ActionCable.server }

  describe '.send_message' do
    let!(:chat) do
      create(:chat, :with_messages, user_ids: [user.id])
    end

    before do
      allow(chat_cable).to receive(:broadcast)
    end

    context 'on a private chat' do
      let(:message) do
        create(:message, chat_id: chat.id,
                         sender_id: user.id)
      end

      it 'broadcasts to both users' do
        ChatService.create_message(chat, 'some content', user)

        expect(chat_cable)
          .to have_received(:broadcast)
      end
    end
  end
end
