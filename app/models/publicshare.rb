class Publicshare < ActiveRecord::Base
  attr_accessible :post_id, :publicable_id, :publicable_type, :pet_id, :user_id

  belongs_to :publicable, :polymorphic => true
  belongs_to :post

  validates :publicable_id, :publicable_type, :post_id, :presence => true
  validates_uniqueness_of :post_id, :scope => [:publicable_id, :publicable_type]
end
