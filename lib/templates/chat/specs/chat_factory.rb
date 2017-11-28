FactoryBot.define do
  factory :chat do
    name { sequence { |n| "user#{n}_user#{n + 1}" } }

    after(:create) do |chat|
      chat.users << FactoryBot.create(:user)
      chat.users << FactoryBot.create(:user)
    end
  end
end
