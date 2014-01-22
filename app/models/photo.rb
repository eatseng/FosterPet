class Photo < ActiveRecord::Base
  attr_accessible :description, :photo_url, :user_id

  has_many :taggings, :dependent => :destroy

  validates :photo_url, :user_id, :presence => true
end
