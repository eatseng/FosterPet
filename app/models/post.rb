class Post < ActiveRecord::Base
  attr_accessible :body, :photo_url, :user_id

  has_many :postshares, :dependent => :destroy
  has_many :photoposttags, :dependent => :destroy

  validates :user_id, :presence => true
  validate :photo_or_body

  def photo_or_body
    if photo_url.blank? && body.blank?
      errors[:base] << ("Please fill in post body or photo url")
    end
  end
end
