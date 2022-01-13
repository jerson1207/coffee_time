admin = User.new(name: "Admin", email:"admin@test.com", role: 1, password: "123456", password_confirmation: "123456")
admin.save
puts "admin has created"
user = User.new(name: "User Juan", email:"user1@test.com", role: 0, password: "123456", password_confirmation: "123456")
user.save