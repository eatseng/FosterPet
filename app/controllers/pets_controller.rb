class PetsController < ApplicationController
  before_filter :require_current_user!

  def index
    @pets = Pet.includes(:followings)

    pets_json = []
    @pets.each do |pet|
      following = pet.followings.find { |f| f.user_id == current_user.id }
      pet_json = pet.as_json
      pet_json["following"] = following.as_json
      pets_json << pet_json
    end

    render :json => pets_json
  end

  def create
    @pet = Pet.new(params[:pet])
    if @pet.save
      render :json => @pet
    else
      render :json => {errors: @pet.errors.full_message}, status: :unprocessable_entity
    end
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update_attributes(params[:pet])
      render :json => @pet
    else
      render :json => {errors: @pet.errors.full_message}, status: :unprocessable_entity
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    render :json => @pet
    @pet.destroy
  end
end



# json.pets do |pet|
#   pet.id
#   pet.following pet.followings.find { |f| f.user_id == current_user.id }
# end