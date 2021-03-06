class RegistrationsController < Devise::RegistrationsController

  private

  def account_update_params
    params.require(:user).permit(:email, :password, :name, :current_password)
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :name)
  end
end