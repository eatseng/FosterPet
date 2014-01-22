class PostsController < ApplicationController
  before_filter :require_current_user!

  def index
    render :json => Post.all
  end

 def create
    params['post']['user_id'] = current_user.id
    #params['photo']['user_id'] = current_user.id
    params['photos'] = []
    params['photo'].each_with_index { |param, i| params['photos'][i] = params }

    p "SLDKFJL:SDFJSDKLFJ"
    p params

    post = Post.new(params[:post])
    post.photos.new(params[:photo])
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
      p
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

    uniqPosts = []
    posts = current_user.following_pets.includes(:public_posts => :author)
                        .map{ |pet| json_tag_pet_model(pet.public_posts, pet, uniqPosts) }
                        .flatten

    render :json => posts
  end

  def petwall
    @posts = Pet.find(params[:pet_id]).public_posts.includes(:author)
    render :json => json_tag_user_model(@posts)
  end

  def userwall
    @posts_json = json_tag_user_model(User.find(params[:user_id]).public_posts.includes(:author))
    @posts_json.concat(json_tag_recipients(Post.where('user_id = ?', params[:user_id])
                                                .includes(:publicshares => :publicable) ))
    render :json => @posts_json
  end


  private


  def json_tag_user_model(posts)
    posts_json = []
    posts.each do |post|
      post_json = post.as_json
      post_json["author"] = post.author.as_json
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