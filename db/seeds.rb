
User.create!(
    email: "test@test.com", 
    password: 'password', 
    password_confirmation: 'password', 
    is_superadmin: true
)

puts "Superadmin created"

5.times do
    User.create!(
        email: Faker::Internet.email, 
        password: 'password', 
        password_confirmation: 'password'
    )
end

puts "Create 5 users"

categories = ["Frontend", "Backend", "Fullstack", "DevOps", "Data Science", "Machine Learning", "Artificial Intelligence", "Cybersecurity", "Blockchain", "Cloud Computing"]

categories.each do |category|
    Category.create!(name: category)
end

puts "Create 10 categories"

50.times do
    Article.create!(
        user_id: rand(1..6),
        title: Faker::Lorem.sentence(word_count: 3),
        body: Faker::Lorem.paragraph(sentence_count: 3),
        status: rand(0..1),
        read: rand(1..25),
        category_id: rand(1..10)
    )
end

puts "Create 50 articles"
