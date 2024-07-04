class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.admin? # Assuming you have an admin? method to check if the user is an admin
      admin_dashboard_path
    else
      root_path
    end
  end
end
