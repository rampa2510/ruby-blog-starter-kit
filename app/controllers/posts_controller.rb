class PostsController < ApplicationController
  def index
    @posts = Post.published
    @posts = @posts.filter_by_tag(params[:tag_id]) if params[:tag_id].present?
  end

  def show
    @post = Post.published.find(params[:id])
  end
end
