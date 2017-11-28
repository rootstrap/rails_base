FactoryBot.define do
  factory :message do
    user 		{ create(:user) }
    chat 		{ create(:chat) }
    content { Faker::ChuckNorris.fact }
  end
end
