# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pet.create(name: "SnowBall", photo_url: "http://placekitten.com/400", likes: "tuna",
          dislikes: "dogs", age: "1 year", gender: "female", breed: "feline", size: "small",
            about: "one cool cat", owner_id: "1")
Pet.create(name: "Candy", photo_url: "http://placekitten.com/401", likes: "milk",
          dislikes: "steak", age: "2 months", gender: "female", breed: "feline", size: "small",
          about: "one sneaky cat")
Pet.create(name: "Buddy", photo_url: "http://placekitten.com/402", likes: "fish",
          dislikes: "sweet things", age: "3 months", gender: "male", breed: "feline", size: "small",
            about: "one hyper cat" owner_id: "1")
Pet.create(name: "BuzzBall", photo_url: "http://placekitten.com/404", likes: "candy",
          dislikes: "cold turkey", age: "7 months", gender: "male", breed: "feline", size: "small",
            about: "one hot cat")
Pet.create(name: "PeachFuzz", photo_url: "http://placekitten.com/405", likes: "fruits",
          dislikes: "water", age: "9 months", gender: "female", breed: "feline", size: "small",
          about: "one fruity cat")
Pet.create(name: "Mavrick", photo_url: "http://placekitten.com/407", likes: "flying",
          dislikes: "migs", age: "16 months", gender: "male", breed: "feline", size: "small",
          about: "one rebel cat")

