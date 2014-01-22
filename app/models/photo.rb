class Photo < ActiveRecord::Base
  attr_accessible :description, :photo_url, :user_id

  has_many :taggings, :dependent => :destroy
  belongs_to(
    :author,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :user_id
    )

  validates :photo_url, :user_id, :presence => true
end
