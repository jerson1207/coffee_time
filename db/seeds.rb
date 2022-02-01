admin = User.new(name: "Admin", email:"admin@test.com", contact: "1234567890", role: 1, password: "123456", password_confirmation: "123456")
admin.save
puts "admin has created"

Menu.create(title: "ESPRESSO", description: "Add hot milk to it and enjoy a hot cup of coffee.", price: 100)
Menu.create(title: "MAZAGRAN COFFEE", description: "Mazagran is poured over ice and in some versions, rum is also added to the mix.", price: 100)
Menu.create(title: "EISCAFFEE", description: "Different countries have their own versions of cold coffee.", price: 100)
Menu.create(title: "MACCHIATO", description: "The word ‘macchiato’ means spotted, the name differentiated between espresso and coffee with a drop of milk.", price: 100)

Menu.create(title: "CAPPUCCINO", description: "The thick foam the mixture creates gives it a velvety texture.", price: 100)
Menu.create(title: "TURKISH COFFEE", description: "Turkish coffee is also used as fortune telling.", price: 100)


user = User.new(name: "User Juan", email:"user1@test.com", contact: "1234567890", role: 0, password: "123456", password_confirmation: "123456")
user.save