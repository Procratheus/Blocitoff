require 'faker'

User.delete_all
List.delete_all
Item.delete_all

# Create Users
5.times do 
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8..20)
    ) 
  user.save!
end
users = User.all

# Create Lists
users.each do |user|
  user.create_list(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence
    )
end

lists = List.all

# Create Items
50.times do
  Item.create!(
    list: lists.sample,
    name: Faker::Lorem.sentence,
    created_at: rand(1.minutes...7.day).ago
    )
end

puts "Seed Finished"
puts "#{User.count} created"
puts "#{List.count} created"
puts "#{Item.count} created"