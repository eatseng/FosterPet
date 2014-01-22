class Tagging < ActiveRecord::Base
  attr_accessible :photo_id, :post_id

  belongs_to :post
  belongs_to :photo

  validates :photo_id, :post_id, :presence => true
  validates_uniqueness_of :photo_id, :scope => [:post_id]
end
