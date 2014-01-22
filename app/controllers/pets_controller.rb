class PetsController < ApplicationController
  before_filter :require_current_user!, :only => [:index]
  before_filter :require_admin_user!, :only => [:create, :update, :destroy]

  def index
    @pets = Pet.includes(:followings, :followers, :owners)
    render :json => pet_to_json(@pets)
  end

  def gallery
    @pet = Pet.includes(:photos, :public_photos).find(params[:pet_id])
    render :json => pet_photo_to_json(@pet)
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


  private
  

  def pet_to_json(pets)
    pets_json = []
    pets.each do |pet|
      following = pet.followings.find { |f| f.user_id == current_user.id }
      pet_json = pet.as_json
      # pet_json["public_photos"] = pet.public_photos.as_json
      # pet_json["private_photos"] = pet.photos.as_json if current_user.id == pet.owner_id
      pet_json["following"] = following.as_json
      pet_json["followers"] = pet.followers.flatten.as_json
      pet_json["owners"] = pet.owners.flatten.as_json
      pets_json << pet_json
    end
    pets_json
  end

  def pet_photo_to_json(pet)
    photos_json = []
    photos_json << pet.public_photos.as_json
    photos_json << pet.photos.as_json if current_user.id == pet.owner_id
    p "DSKLFJLDSKJF"
    p photos_json.flatten
    photos_json.flatten
  end
end

# json.pets do |pet|
#   pet.id
#   pet.following pet.followings.find { |f| f.user_id == current_user.id }
# end