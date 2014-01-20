class Tagging < ActiveRecord::Base
  attr_accessible :photo_id, :tagable_id, :tagable_type, :pet_id, :user_id

  belongs_to :tagable, :polymorphic => true
  belongs_to :photo

  validates :photo_id, :tagable_id, :tagable_type, :presence => true
end
