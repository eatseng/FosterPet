class Testimonial < ActiveRecord::Base
  attr_accessible :body, :user_id, :pet_id

  belongs_to :user
  belongs_to :pet

  validates :body, :user_id, :pet_id, :presence => true
end
