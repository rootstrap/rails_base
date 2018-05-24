FactoryBot.define do
  factory :chat do
    name { Faker::Name.unique.name }

    after(:build) do |chat|
      chat.users << create(:user)
      chat.users << create(:user)
    end

    trait :with_messages do
      transient do
      end

      after(:create) do |chat, _evaluator|
        chat.messages.create!(user_id: chat.users.first,
                              content: Faker::ChuckNorris.fact)
      end
    end
  end
end
