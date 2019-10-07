# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Peter", email: "peter@email.com", password: "password")
User.create(name: "Test", email: "test@email.com", password: "password")

Post.create(user_id: 1, title: Faker::Company.catch_phrase, body: Faker::Hipster.paragraph(sentence_count: 10), image: "https://picsum.photos/200/300/?random")
Post.create(user_id: 1, title: Faker::Company.catch_phrase, body: Faker::Hipster.paragraph(sentence_count: 10), image: "https://picsum.photos/200/300/?random")
Post.create(user_id: 1, title: Faker::Company.catch_phrase, body: Faker::Hipster.paragraph(sentence_count: 10), image: "https://picsum.photos/200/300/?random")
Post.create(user_id: 1, title: Faker::Company.catch_phrase, body: Faker::Hipster.paragraph(sentence_count: 10), image: "https://picsum.photos/200/300/?random")
Post.create(user_id: 1, title: Faker::Company.catch_phrase, body: Faker::Hipster.paragraph(sentence_count: 10), image: "https://picsum.photos/200/300/?random")
Post.create(user_id: 1, title: Faker::Company.catch_phrase, body: Faker::Hipster.paragraph(sentence_count: 10), image: "https://picsum.photos/200/300/?random")
Post.create(user_id: 2, title: Faker::Company.catch_phrase, body: Faker::Hipster.paragraph(sentence_count: 10), image: "https://picsum.photos/200/300/?random")
Post.create(user_id: 2, title: Faker::Company.catch_phrase, body: Faker::Hipster.paragraph(sentence_count: 10), image: "https://picsum.photos/200/300/?random")
Post.create(user_id: 2, title: Faker::Company.catch_phrase, body: Faker::Hipster.paragraph(sentence_count: 10), image: "https://picsum.photos/200/300/?random")
