require 'rails_helper'

describe Chat do
  describe 'chat validations' do
    it 'have a name' do
      subject build :chat
      it { should validate_presence_of(:name) }
    end

    it 'have no user and fail' do
      subject build :chat
      subject.users = nil
      it { should_not be_valid }
    end

    it 'have 1 user and fail' do
      subject build :chat
      subject.users.pop
      it { should_not be_valid }
    end

    it 'have 2 user and be created' do
      subject build :chat
      it { should be_valid }
    end
  end
end
