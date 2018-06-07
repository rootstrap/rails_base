require 'rails_helper'

RSpec.describe ApplicationCable::Connection, type: :channel do
  let(:user) { create(:user) }

  it 'successfully connects' do
    connect "/cable?user=#{user.id}"
    expect(connection.current_user).to eq user
  end
end
