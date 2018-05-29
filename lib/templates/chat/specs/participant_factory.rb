FactoryBot.define do
  factory :participant do
    user { create(:user) }
    chat { create(:chat) }
    last_connection nil
  end
end
