class PetsController < ApplicationController
  before_filter :require_current_user!

  def index
    @pets = Pet.all
    render :json => @pets
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
