class WriterController < ApplicationController
  before_action :authenticate_user!
  before_action :check_writer
  def dashboard
    @posts = current_user.posts.order(created_at: :desc)
  end

  def check_writer
    redirect_to root_path, alert: 'Access denied.' unless current_user.writer?
  end
end
