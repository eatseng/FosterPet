class Post < ActiveRecord::Base
  attr_accessible :body, :photo_url, :user_id

  has_many :postshares, :dependent => :destroy
  has_many :publicshares, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
  has_many :photos, :through => :taggings, :source => :photo
  belongs_to(
    :author,
    class_name: "User",
    :primary_key => :id,
    :foreign_key => :user_id
  )

  validates :user_id, :presence => true
  validate :photo_or_body

  def photo_or_body
    if photo_url.blank? && body.blank?
      errors[:base] << ("Please fill in post body or photo url")
    end
  end
end
