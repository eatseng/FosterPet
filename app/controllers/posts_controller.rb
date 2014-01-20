class PostsController < ApplicationController
  before_filter :require_current_user!

  def index
    render :json => Post.all
  end

 def create
    params['post']['user_id'] = current_user.id
    post = Post.new(params[:post])
    if post.save
      begin
        ActiveRecord::Base.transaction do
          find_postable.map do |base|
            post.postshares.new({
              :postable_type => base.class.name,
              :postable_id => base.id,
              :post_id => (Post.last.id + 1)
              })
            post.save
          end
        end
        render :json => {success: "post saved"}
      rescue ActiveRecord::RecordInvalid => invalid
        render :json => {errors: "errors saving post"}, status: :unprocessable_entity
      end
    else
      render :json => {errors: "ERRORS"}, status: :unprocessable_entity
    end

  end

  # def create
  #   params['post']['user_id'] = current_user.id
  #   begin
  #     ActiveRecord::Base.transaction do
  #       find_postable.map do |base|
  #         base.posts.build(params[:post])
  #         base.save
  #       end
  #     end
  #     render :json => {success: "post saved"}
  #   rescue ActiveRecord::RecordInvalid => invalid
  #     render :json => {errors: "errors saving post"}, status: :unprocessable_entity
  #   end
  # end

  def destroy

  end

  def feeds
    posts = current_user.following_pets
                        .map{ |pet| json_tag_pet_model(pet.posts, pet) }
                        .flatten.uniq
    
    #render :json => json_tag_user_model(posts)
    render :json => posts
  end

  def petwall
    @posts = Pet.find(params[:pet_id]).posts
    render :json => json_tag_user_model(@posts)
  end


  private

  def json_tag_user_model(posts)
    posts_json = []
    posts.each do |post|
      post_json = post.as_json
      post_json["user"] = User.find(post.user_id).as_json
      posts_json << post_json
    end
    posts_json
  end

  def json_tag_pet_model(posts, pet)
    posts_json = []
    posts.each do |post|
      post_json = post.as_json
      post_json["pet"] = pet.as_json
      post_json["user"] = User.find(post.user_id).as_json
      posts_json << post_json
    end
    posts_json
  end


  def find_postable
    arr = []
    params[:postshare].each do |name, value|
      value.each do |val|
        if name =~ /(.+)_id$/
          arr.push($1.classify.constantize.find(val))
        end
      end
    end
    arr
  end
end