class Postshare < ActiveRecord::Base
  attr_accessible :show, :post_id, :postable_id, :postable_type, :pet_id, :user_id

  belongs_to :postable, :polymorphic => true
  #belongs_to :pet
  belongs_to :post

  validates :postable_id, :postable_type, :post_id, :presence => true
end
