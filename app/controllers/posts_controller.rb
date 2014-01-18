class PostsController < ApplicationController
  before_filter :require_current_user!

  def index
    render :json => Post.all
  end

  def create
    params['post']['user_id'] = current_user.id
    @postable = find_postable
    begin
      ActiveRecord::Base.transaction do
        @postable.map do |base|
          base.posts.new(params[:post])
          base.save
        end
      end
      render :json => {success: "post saved"}
    rescue ActiveRecord::RecordInvalid => invalid
      render :json => {errors: "errors saving post"}, status: :unprocessable_entity
    end
  end

  def destroy

  end

  def feeds
    render :json => Post.select("DISTINCT body, photo_url")
  end


  private


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