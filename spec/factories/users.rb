FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      email { "luisscaceress4@gmail.com" }
      password { "Avengers2019" }
    end
  end
