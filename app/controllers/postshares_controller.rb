class PostsharesController < ApplicationController
  before_filter :require_current_user!

  def index
    uniqPosts = []
    postshares = current_user.owned_pets.includes(:postshares => { :post => :author })
                        .map{ |pet| json_tag_model(pet.postshares, pet) }
                        .flatten
    render :json => postshares
  end

  def publicshare
    uniqPosts = []
    postshares = current_user.owned_pets.includes(:publicshares => { :post => :author })
                        .map{ |pet| json_tag_model(pet.publicshares, pet) }
                        .flatten
    render :json => postshares
  end

  def create
    publicshare = Publicshare.find(params[:publicshare_id])
    render :json => publicshare

    params['postshare'] = {}
    params['postshare']['postable_type'] = publicshare.publicable.class.name
    params['postshare']['postable_id'] = publicshare.publicable.id
    params['postshare']['post_id'] = publicshare.post.id

    post = publicshare.post
    post.postshares.new(params[:postshare])
    post.save
    publicshare.destroy
  end

  def destroy
    postshare = Postshare.find(params[:id])
    render :json => postshare

    params['publicshare'] = {}
    params['publicshare']['publicable_type'] = postshare.postable.class.name
    params['publicshare']['publicable_id'] = postshare.postable.id
    params['publicshare']['post_id'] = postshare.post.id

    post = postshare.post
    post.publicshares.new(params[:publicshare])
    post.save
    postshare.destroy
  end

  private

  def json_tag_model(postshares, pet)
    postshares_json = []
    postshares.each do |postshare|
      postshare_json = postshare.as_json
      postshare_json["pet"] = pet.as_json
      postshare_json["user"] = postshare.post.author.as_json
      postshare_json["post"] = postshare.post.as_json
      postshares_json << postshare_json
    end
    postshares_json
  end
end
