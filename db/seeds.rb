# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:username => "Edward", :password => "password")
User.create(:username => "admin", :password => "password", :account_type => "admin")
User.create(:username => "Ned", :password => "password")
User.create(:username => "Flarnie", :password => "password")
User.create(:username => "CJ", :password => "password")
User.create(:username => "Jeff", :password => "password")
User.create(:username => "Ryan", :password => "password")

Pet.create(name: "SnowBall", photo_url: "http://placekitten.com/400", likes: "tuna",
          dislikes: "dogs", age: "1 year", gender: "female", breed: "feline", size: "small",
            about: "one cool cat", owner_id: "1")
Pet.create(name: "Candy", photo_url: "http://placekitten.com/401", likes: "milk",
          dislikes: "steak", age: "2 months", gender: "female", breed: "feline", size: "small",
          about: "one sneaky cat")
Pet.create(name: "Buddy", photo_url: "http://placekitten.com/402", likes: "fish",
          dislikes: "sweet things", age: "3 months", gender: "male", breed: "feline", size: "small",
            about: "one hyper cat", owner_id: "1")
Pet.create(name: "BuzzBall", photo_url: "http://placekitten.com/404", likes: "candy",
          dislikes: "cold turkey", age: "7 months", gender: "male", breed: "feline", size: "small",
            about: "one hot cat")
Pet.create(name: "PeachFuzz", photo_url: "http://placekitten.com/405", likes: "fruits",
          dislikes: "water", age: "9 months", gender: "female", breed: "feline", size: "small",
          about: "one fruity cat")
Pet.create(name: "Mavrick", photo_url: "http://placekitten.com/407", likes: "flying",
          dislikes: "migs", age: "16 months", gender: "male", breed: "feline", size: "small",
          about: "one rebel cat")

200.times {|i|
  name = Faker::Name.first_name
  photo = 407 + i*1
  Pet.create(name: name, photo_url: "http://placekitten.com/" + photo.to_s, likes: "flying",
            dislikes: "migs", age: "16 months", gender: "male", breed: "feline", size: "small",
            about: "one rebel cat")
}