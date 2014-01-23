class Post < ActiveRecord::Base
  attr_accessible :body, :user_id, :photos

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

  # def body_check
  #   if body.blank?
  #     errors[:base] << ("Body Cannot Be Blank!")
  #   end
  # end

  def photo_or_body
    if photos.empty? && body.blank?
      errors[:base] << ("Please fill in post body or photo url")
    end
  end
end
