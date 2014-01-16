class Following < ActiveRecord::Base
  attr_accessible :pet_id, :user_id

  belongs_to :user
  belongs_to :pet

  validates :pet_id, :user_id, :presence => true
end
