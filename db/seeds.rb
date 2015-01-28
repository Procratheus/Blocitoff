require 'faker'

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
5.times do
    list = List.new(
      user: users.sample,
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph
      )
    unless List.find(:user).count == nil
      list.update!(user: users.sample)
    end
  list.save
end

lists = List.all

# Create Items
40.times do
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