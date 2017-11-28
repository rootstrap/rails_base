FactoryBot.define do
  factory :participant do
    user { create(:user) }
    chat { create(:chat) }
    last_message nil
    last_connection nil
  end
end
