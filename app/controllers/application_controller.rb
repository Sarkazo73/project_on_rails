class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_root_path
    else
      tickets_path
    end
  end

end
