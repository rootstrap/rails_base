require 'rails_helper'

describe Participant do
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }
  let(:chat) { create(:chat) }

  before(:each) do
    create(:participant, user: user_1, chat: chat)
  end

  describe 'validate uniqueness of user for a chat' do
    it 'fail due to user already in chat' do
      expect(build(:participant, user: user_1, chat: chat)).to have(1).errors_on(:participant)
    end

    it 'step the user into the chat' do
      expect(build(:participant, user: user_2, chat: chat)).to have(0).errors_on(:participant)
    end
  end
end
