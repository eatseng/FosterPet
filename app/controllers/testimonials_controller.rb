class TestimonialsController < ApplicationController
  def index
    render :json => json_tag_user_model(Testimonial.where('pet_id = ?', params[:pet_id]))
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

  
  private


  def json_tag_user_model(testimonials)
    testimonials_json = []
    testimonials.each do |testimonial|
      testimonial_json = testimonial.as_json
      testimonial_json["user"] = User.find(testimonial.user_id).as_json
      testimonials_json << testimonial_json
    end
    testimonials_json
  end
end
