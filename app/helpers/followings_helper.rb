module FollowingsHelper
  def can_follow?(user_id, pet_id)
    Following.find_by_user_id_and_pet_id(user_id, pet_id).nil?
  end
end
