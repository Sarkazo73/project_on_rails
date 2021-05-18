class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_resources_index_path
    else
      user_tickets_path(user_id: current_user.id)
    end
  end

end
