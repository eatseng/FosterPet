class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:show]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def index
    @users = User.includes(:following_pets)

    users_json = []
    @users.each do |user|
      user_json = user.as_json
      user_json["following_pets"] = user.following_pets.as_json
      user_json["owned_pets"] = user.owned_pets.as_json
      users_json << user_json
    end

    render :json => users_json
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
end
