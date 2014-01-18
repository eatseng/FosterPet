class Following < ActiveRecord::Base
  attr_accessible :pet_id, :user_id

  belongs_to :user
  belongs_to :pet

  validates :pet_id, :user_id, :presence => true
  validates_uniqueness_of :user_id, :scope => [:pet_id]
end
