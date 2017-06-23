10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

User.create!([
  {
    email: "logan@mcan.sh",
    password: "password",
    reset_password_token: nil,
    reset_password_sent_at: nil,
    remember_created_at: nil,
    sign_in_count: 1,
    current_sign_in_at: "2017-06-23",
    last_sign_in_at: "2017-06-23",
    current_sign_in_ip: "127.0.0.1",
    last_sign_in_ip: "127.0.0.1"
  }
])
