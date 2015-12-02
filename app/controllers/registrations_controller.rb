class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :avatar)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password, :password_confirmation, :current_password, :avatar)
    end
  end
end
