class Photoposttag < ActiveRecord::Base
  attr_accessible :photo_id, :post_id

  belongs_to :post
  belongs_to :photo

  validates :photo_id, :post_id, :presence => true
end
