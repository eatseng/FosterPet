class FollowingsController < ApplicationController
  before_filter :require_current_user!

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
