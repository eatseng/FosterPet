class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:show]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def index
    @users = User.includes(:following_pets, :owned_pets)
    render :json => user_data_to_json(@users)
  end

  def gallery
    @user = User.includes(:photos, :public_photos).find(params[:user_id])
    render :json => user_photo_to_json(@user)
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to user_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  def show
    if params.include?(:id)
      @user = User.find(params[:id])
    else
      redirect_to user_url(current_user)
    end
  end


  private


  def user_data_to_json(users)
    users_json = []
    users.each do |user|
      user_json = user.as_json
      user_json["following_pets"] = user.following_pets.as_json
      user_json["owned_pets"] = user.owned_pets.as_json
      users_json << user_json
    end
    users_json
  end

  def user_photo_to_json(user)
    photos_json = []
    photos_json << user.public_photos.as_json
    photos_json << user.photos.as_json if current_user.id == user.id
    photos_json.flatten
  end
end
