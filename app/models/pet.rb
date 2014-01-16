class Pet < ActiveRecord::Base
  attr_accessible :about, :age, :dislikes, :gender, :likes, :name, :photo_url, :size

  has_many :followings
  has_many :followers, :through => :followings, :source => :user
  has_many :postshares, :as => :postable
  has_many :posts, :through => :postshares, :source => :post
  has_many :testimonials

  validates :name, :presence => true
end
