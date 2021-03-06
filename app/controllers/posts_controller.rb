class PostsController < ApplicationController
  before_filter :require_current_user!

  def index
    render :json => Post.all
  end

 def create
    params['post']['user_id'] = current_user.id
    post = Post.new(params[:post])
    if params[:photo]
      params[:photo].each { |photo| post.photos.new(photo) unless photo['photo_url'].blank?}
    end
    p post.photos
    if post.save
      begin
        ActiveRecord::Base.transaction do
          find_postable.map do |base|
            unless base.class.name == "User" && base.id == current_user.id
              post.postshares.new({
                :postable_type => base.class.name,
                :postable_id => base.id,
                })
              post.save
            end
          end
        end
        render :json => {success: "post saved"}
      rescue ActiveRecord::RecordInvalid => invalid
        render :json => {errors: "errors saving post"}, status: :unprocessable_entity
        post.destroy
      end
    else
      render :json => {errors: post.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def feeds

    uniqPosts = []
    posts = current_user.following_pets.includes(:public_posts => [:author, :photos])
                        .map{ |pet| json_tag_pet_model(pet.public_posts, pet, uniqPosts) }
                        .flatten

    render :json => posts
  end

  def petwall
    @posts = Pet.find(params[:pet_id]).public_posts.includes(:author, :photos)
    render :json => json_tag_user_model(@posts)
  end

  def userwall
    @posts_json = json_tag_user_model(User.find(params[:user_id]).public_posts.includes(:author))
    @posts_json.concat(json_tag_recipients(Post.where('user_id = ?', params[:user_id])
                                                .includes(:photos, :publicshares => :publicable) ))
    render :json => @posts_json
  end


  private


  def json_tag_user_model(posts)
    posts_json = []
    posts.each do |post|
      post_json = post.as_json
      post_json["author"] = post.author.as_json
      post_json["photos"] = post.photos.as_json
      posts_json << post_json
    end
    posts_json
  end

  def json_tag_pet_model(posts, pet, uniqPosts)
    posts_json = []
    posts.each do |post|
      unless uniqPosts.include?(post)
        uniqPosts << post
        post_json = post.as_json
        post_json["pet"] = pet.as_json
        post_json["user"] = post.author.as_json
        post_json["photos"] = post.photos.as_json
        posts_json << post_json
      end
    end
    posts_json
  end

  def json_tag_recipients(posts)
    posts_json = []
    posts.each do |post|
      post_json = post.as_json
      post_json["pet"] = []
      post_json["user"] = []
      post_json["photos"] = post.photos.as_json
      recipients = post.publicshares.each do |publicshare|
        if publicshare.publicable_type == "Pet"
          post_json["pet"] << publicshare.publicable
        else
          post_json["user"] << publicshare.publicable
        end
      end
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