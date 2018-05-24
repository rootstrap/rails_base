FactoryBot.define do
  factory :message do
    chat { create(:chat) }
    user { chat.users.first }
    content { Faker::ChuckNorris.fact }
  end
end
