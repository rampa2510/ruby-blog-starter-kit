class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def dashboard
    @users = User.where.not(id: current_user.id)
  end

  private

  def check_admin
    redirect_to root_path, alert: 'Access denied.' unless current_user.role == 'admin'
  end
end
