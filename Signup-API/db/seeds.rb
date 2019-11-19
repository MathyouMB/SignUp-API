User.create(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
  password_confirmation: ENV['ADMIN_PASSWORD'],
  first_name: ENV['ADMIN_FIRST_NAME'],
  last_name: ENV['ADMIN_LAST_NAME']
)

10.times do
  Board.create({
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    user_id: 1
  })
end
