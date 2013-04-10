Store.create(name: 'Best Sunglasses', path: 'best-sunglasses', description: 'Buy our Sunglasses')
Store.create(name: 'Cool Sunglasses', path: 'cool-sunglasses', description: 'Buy our COOL Sunglasses')

Category.create(title: "Wayfarers", store_id: 1)
Category.create(title: "Raybans", store_id: 1)
Category.create(title: "Serengetis", store_id: 2)
Category.create(title: "Raybans", store_id: 2)

n = 1
50.times do
  Product.create(title: "Product #{n}", description: "Great product", price: 500, status: 'active', store_id: 1, category_ids: [1])
  Product.create(title: "Product #{n}", description: "Great product", price: 500, status: 'active', store_id: 2, category_ids: [3])
  n += 1
  Product.create(title: "Product #{n}", description: "Great product", price: 500, status: 'active', store_id: 1, category_ids: [2])
  Product.create(title: "Product #{n}", description: "Great product", price: 500, status: 'active', store_id: 2, category_ids: [4])
  n += 1
end

user1 = User.create(full_name: "Franklin Webber", email: "demoXX+franklin@jumpstartlab.com", password: "password")
user2 = User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com", password: "password", display_name: "j3")
user3 = User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com", password: "password", display_name: "SkrilleX")
user4 = User.create(full_name: "Katrina", email: "demoXX+katrina@jumpstartlab.com", password: "password", display_name: "Norway")

user1.user_role.role = "store_admin"
user1.save
user2.user_role.role = "stocker"
user2.save
user3.platform_admin = true
user3.save

UserRole.create(user_id: user1.id, role: "store_admin")
UserRole.create(user_id: user2.id, role: "stocker")