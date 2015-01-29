user = User.create(username: "sagar", password: "admin", password_confirmation: "admin", email: "sagar@dbc.com")
category = Category.create(title: "Electronics & Computers")
category1 = Category.create(title: "Clothing & Shoes")
category2 = Category.create(title: "Food")
category3 = Category.create(title: "Sport")

Receipt.create(title: "Walmart", url: "http://files.schuminweb.com/life-and-times/2005/virginia-beach-2005/receipt.png",
              category: category2, user: user)

Receipt.create(title: "Walmart", url: "http://coolpoolmedia.zenfolio.com/img/s3/v39/p54123439-3.jpg",
              category: category3, user: user)

Receipt.create(title: "Coffee & Bagel", url: "http://ujg1i3ze1133y9zav35eixy117m.wpengine.netdna-cdn.com/wp-content/uploads/2014/07/ShopKeep-Custom-Email-Receipt-Example.jpg",
              category: category2, user: user)
