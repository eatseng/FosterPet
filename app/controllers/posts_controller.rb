class PostsController < ApplicationController
  def index
    render :json => Post.all
  end

  def create
    p "LKDSJF:LSDKJFL:KS"
    p params
    @commentable = create_postshare_hash
    p "AFTER"
    p params

    post = post.new(params[:post])
    post.postshares.new()

  end

  def destroy

  end

  private

  def create_postshare_hash
    i = 0
    params['postshares']
    params[:postshare].each do |name, value|
      value.each do |val|
        if name =~ /(.+)_id$/
          params['postshares'][i.to_s] = {:postable_id => val.to_s, :postable_type => $1.classify.constantize}
          i += 1
        end
      end
    end
  end
end
