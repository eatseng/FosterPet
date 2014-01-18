class TestimonialsController < ApplicationController
  def index
    render :json => Testimonial.all
  end

  def create
    params['testimonial']['user_id'] = current_user.id
    testimonial = Testimonial.new(params[:testimonial])
    if testimonial.save
      render :json => testimonial
    else
      render :json => {errors: testimonial.errors.full_message}, status: :unprocessable_entity
    end
  end

  def destroy
    testimonial = Testimonial.find(params[:id])
    render :json => testimonial
    testimonial.destroy
  end
end
