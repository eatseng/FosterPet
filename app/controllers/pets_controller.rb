class PetsController < ApplicationController
  def index
    @pets = Pet.all
    render :json => @pets
  end

  def create
    p "A:LKSDJ:LDFJDS"
    p params
  end

  def destroy
    p "A:LKSDJ:LDFJDS"
    p params
  end
end
