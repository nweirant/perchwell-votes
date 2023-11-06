
FactoryBot.define do
  factory :client do
    name { Faker::Lorem.sentence }
  end
end

FactoryBot.define do
  factory :vote do
    client_id { SecureRandom.uuid }
  end
end
