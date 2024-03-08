FactoryBot.define do
    factory :article do
        title { Faker::Lorem.sentence(word_count: 3)}
        body { Faker::Lorem.paragraph(sentence_count: 3)}
        status { rand(0..1) }
        read { rand(5..25) }
        category { FactoryBot.create(:category) }
        author { FactoryBot.create(:user) }
    end
end