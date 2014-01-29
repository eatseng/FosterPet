# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:username => "Edward", :password => "password",
            :photo_url => "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ1uUDcC75ZGxRWELTdsVDmEYyeiWRVHOG8w2TJI7dK-A1kTv9cZQ")
User.create(:username => "Guest", :password => "password",
            :photo_url => "http://most.themost10.netdna-cdn.com/wp-content/uploads/2012/08/Self-Portrait-By-Ira-Ira-Chernova-10.jpg")
User.create(:username => "admin", :password => "password", :account_type => "admin",
            :photo_url => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUWNE4VN1Evl_fRo9O6IICf6Ais_p8KurUG7GhFEvNVrLxzgUG7Q")
User.create(:username => "Ned", :password => "password",
            :photo_url => "http://vintageprintable.com/wordpress/wp-content/uploads/2010/07/Portrait-Face-Painting-Courbert-self-portrait.jpg")
User.create(:username => "Flarnie", :password => "password",
            :photo_url => "http://c300221.r21.cf1.rackcdn.com/orest-kiprensky-portrait-of-e-telesheva-as-zelia-1828-1352764751_b.jpg")
User.create(:username => "CJ", :password => "password",
            :photo_url => "http://www.yoyita.com/In%20Progress/Selfportrait2.jpg")
User.create(:username => "Jeff", :password => "password",
            :photo_url => "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQdtnAYneEJZaNH0nvgj0wMZW_8k6-xrvjXDxD8mSoGbDjfrsQF")
User.create(:username => "Ryan", :password => "password",
            :photo_url => "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQxuKqJ6dGoOQD1lAgBF9xevpPdE1V57ZVL5RuASdxg0IYIBU1A")

Pet.create(name: "SnowBall", photo_url: "http://placekitten.com/400", likes: "tuna",
          dislikes: "dogs", age: "1 year", gender: "female", breed: "feline", size: "small",
            about: "one cool cat", owner_id: "2")
Pet.create(name: "Candy", photo_url: "http://placekitten.com/401", likes: "milk",
          dislikes: "steak", age: "2 months", gender: "female", breed: "feline", size: "small",
          about: "one sneaky cat", owner_id: "2")
Pet.create(name: "Buddy", photo_url: "http://placekitten.com/402", likes: "fish",
          dislikes: "sweet things", age: "3 months", gender: "male", breed: "feline", size: "small",
            about: "one hyper cat", owner_id: "2")
Pet.create(name: "BuzzBall", photo_url: "http://placekitten.com/404", likes: "candy",
          dislikes: "cold turkey", age: "7 months", gender: "male", breed: "feline", size: "small",
            about: "one hot cat", owner_id: "1")
Pet.create(name: "PeachFuzz", photo_url: "http://placekitten.com/405", likes: "fruits",
          dislikes: "water", age: "9 months", gender: "female", breed: "feline", size: "small",
          about: "one fruity cat", owner_id: "1")
Pet.create(name: "Mavrick", photo_url: "http://placekitten.com/407", likes: "flying",
          dislikes: "migs", age: "16 months", gender: "male", breed: "feline", size: "small",
          about: "one rebel cat", owner_id: "1")

200.times {|i|
  name = Faker::Name.first_name
  photo = 407 + i*1
  Pet.create(name: name, photo_url: "http://placekitten.com/" + photo.to_s, likes: "flying",
            dislikes: "migs", age: "16 months", gender: "male", breed: "feline", size: "small",
            about: "one rebel cat")
}

3.times {|i|
  Ownership.create(:user_id => 2, :pet_id => i+1)
}

10.times {|i|
  Following.create(:user_id => "1", :pet_id => i+1)
  Following.create(:user_id => "2", :pet_id => i+1)
}

#post 1
Post.create(:body => "Checkout these really cute dogs!!!", :user_id => "1")
Photo.create(:photo_url => "http://www.hdwallpapers3g.com/wp-content/uploads/2013/11/very-cute-dog-background-1600x1200-1007067.jpg",
              :description => "Check me out!", :user_id => "1")
Photo.create(:photo_url => "http://www.fakc.org/images/pups.jpg",
              :description => "So cute!", :user_id => "1")
Photo.create(:photo_url => "http://www.ryanseacrest.com/wp-content/uploads/2012/08/Boo-The-Dog.jpg",
              :description => "This is Boo", :user_id => "1")
Photo.create(:photo_url => "http://images2.fanpop.com/images/photos/4900000/cute-dogs-4904292-450-431.jpg",
              :description => "Look at him!", :user_id => "1")
Tagging.create(:photo_id => "1", :post_id => "1")
Tagging.create(:photo_id => "2", :post_id => "1")
Tagging.create(:photo_id => "3", :post_id => "1")
Tagging.create(:photo_id => "4", :post_id => "1")

10.times {|i|
  Publicshare.create(:post_id => "1", :publicable_id => i+1, :publicable_type => "Pet")
}

#post 2
Post.create(:body => "Look what I found? Some really cute birds!!!", :user_id => "5")
Photo.create(:photo_url => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCQQ7emDA-RbuamuwhXhWgLLBzIU6juDwcS7pzEVwWuUxBNMuOog",
              :description => "Nice color!", :user_id => "5")
Photo.create(:photo_url => "http://www.b3tards.com/u/420c52b7900bd7084f02/evolution-too-cute-birds.jpg",
              :description => "Happy birds!", :user_id => "5")
Tagging.create(:photo_id => "5", :post_id => "2")
Tagging.create(:photo_id => "6", :post_id => "2")
10.times {|i|
  Publicshare.create(:post_id => "2", :publicable_id => i+1, :publicable_type => "Pet")
}

#post3
Post.create(:body => "I find you to be super adorable!", :user_id => "4")
10.times {|i|
  Publicshare.create(:post_id => "3", :publicable_id => i+1, :publicable_type => "Pet")
}

#Post4
Post.create(:body => "Hey I want to welcome you to this site!", :user_id => "1")
5.times {|i|
  Publicshare.create(:post_id => "4", :publicable_id => (i+2), :publicable_type => "User")
}

#Post5
Post.create(:body => "Feel free to follow different pet to see different feeds!", :user_id => "1")
5.times {|i|
  Publicshare.create(:post_id => "5", :publicable_id => (i+2), :publicable_type => "User")
}

#Post6
Post.create(:body => "Also check out the post approval to make posts for your pet public! That way other users can see the post on their feeds",
             :user_id => "1")
5.times {|i|
  Publicshare.create(:post_id => "6", :publicable_id => (i+2), :publicable_type => "User")
}

#post 7
Post.create(:body => "Awesome animals!!", :user_id => "6")
Photo.create(:photo_url => "http://animals.loepr.com/wp-content/uploads/2013/06/Cute-animals-pictures-41.jpg",
              :description => "Cool cat!", :user_id => "6")
Photo.create(:photo_url => "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSrooHRmUQw5Gg16HQ9CglibJLWvfCTjvUX5rx-xzG4DiQDZhnWIA",
              :description => "Cool dogs!", :user_id => "6")
Photo.create(:photo_url => "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRNSWUKpXfCkaX9ctX1Psc783d7TEMhbl9hUXIBioQYcvmG31pxjw",
              :description => "Cool dogs!", :user_id => "6")
Tagging.create(:photo_id => "7", :post_id => "7")
Tagging.create(:photo_id => "8", :post_id => "7")
Tagging.create(:photo_id => "9", :post_id => "7")
Postshare.create(:post_id => "7", :postable_id => "1", :postable_type => "Pet")

#post8
Post.create(:body => "Wow these bears are huge!!", :user_id => "7")
Photo.create(:photo_url => "http://placebear.com/g/400/300",
              :description => "bears!", :user_id => "7")
Photo.create(:photo_url => "http://placebear.com/g/400/301",
              :description => "bears!", :user_id => "7")
Photo.create(:photo_url => "http://placebear.com/g/400/302",
              :description => "bears!", :user_id => "7")
Photo.create(:photo_url => "http://placebear.com/g/400/303",
              :description => "bears!", :user_id => "7")
Tagging.create(:photo_id => "10", :post_id => "8")
Tagging.create(:photo_id => "11", :post_id => "8")
Tagging.create(:photo_id => "12", :post_id => "8")
Tagging.create(:photo_id => "13", :post_id => "8")
Postshare.create(:post_id => "8", :postable_id => "2", :postable_type => "Pet")


#post9
Post.create(:body => "Cute litte pigs!!", :user_id => "8")
Photo.create(:photo_url => "http://babyanimalzoo.com/wp-content/uploads/2011/12/cute-baby-piglet.jpg",
              :description => "Cute pig!", :user_id => "8")
Photo.create(:photo_url => "http://babyanimalzoo.com/wp-content/uploads/2011/12/baby-pig.jpg",
              :description => "Cute pig!", :user_id => "8")
Photo.create(:photo_url => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ71xev9a2uYPDsSm2RYfuWUyPboiTqY7JhFclVgmGQhiAl7z8t",
              :description => "Cute pig!", :user_id => "8")
Photo.create(:photo_url => "http://www.coolanimalworld.com/gallery/var/albums/Cute-miniature-pigs'-happy-life/Cute%20miniature%20pigs'%20happy%20life%20(04).jpg?m=1382582253",
              :description => "Cute Pig!", :user_id => "8")
Tagging.create(:photo_id => "14", :post_id => "9")
Tagging.create(:photo_id => "15", :post_id => "9")
Tagging.create(:photo_id => "16", :post_id => "9")
Tagging.create(:photo_id => "17", :post_id => "9")
20.times {|i|
  Publicshare.create(:post_id => "9", :publicable_id => i, :publicable_type => "Pet")
}