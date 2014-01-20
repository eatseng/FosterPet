class Pet < ActiveRecord::Base
  attr_accessible :about, :age, :dislikes, :gender, :likes, :name, :photo_url, :size

  has_many :followings, :dependent => :destroy
  has_many :followers, :through => :followings, :source => :user
  has_many :postshares, :as => :postable, :dependent => :destroy
  has_many :posts, :through => :postshares, :source => :post
  has_many :testimonials
  has_many :taggings, :dependent => :destroy
  has_many :photos, :through => :taggings, :source => :photo

  validates :name, :presence => true

  # def as_json(options)
  #   super(:include => :followings)
  # end
end
