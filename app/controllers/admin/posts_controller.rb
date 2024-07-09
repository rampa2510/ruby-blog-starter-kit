class Admin::PostsController < ApplicationController
  before_action :set_post, only: %i[show publish request_changes]

  def index
    @posts = Post.all
  end

  def show; end

  def publish
    if @post.publish!
      redirect_to admin_posts_path, notice: 'Post was successfully approved and published.'
    else
      redirect_to admin_post_path(@post), alert: 'Failed to approve the post.'
    end
  end

  def request_changes
    if @post.request_changes!
      redirect_to admin_posts_path, notice: 'Changes have been requested for the post.'
    else
      redirect_to admin_post_path(@post), alert: 'Failed to request changes for the post.'
    end
  end

  def archive
    if @post.archive!
      redirect_to admin_posts_path, notice: 'Archived post'
    else
      redirect_to admin_post_path(@post), alert: 'Unable to archive the post'
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
