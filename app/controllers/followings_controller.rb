class FollowingsController < ApplicationController
  def create
    params['following']['user_id'] = current_user.id
    following = Following.new(params[:following])
    if following.save
      render :json => following
    else
      render :json => {errors: "invalid input"}, status: :unprocessable_entity
    end
  end

  def destroy
    following = Following.find(params[:id])
    favorite.destroy
    render :json => following
  end
end
