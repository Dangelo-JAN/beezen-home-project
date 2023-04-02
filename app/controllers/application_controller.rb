class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied!'
    redirect_to tasks_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname])
  end
end
