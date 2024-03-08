FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        password { "password" }
        is_superadmin { false }
    end
  end