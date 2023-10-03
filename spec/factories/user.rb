FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    email
    name { Faker.name }
    provider { "github" }
    nickname { "ineedjet" }
    password { "123456789" }
    password_confirmation { "123456789" }
  end
end
