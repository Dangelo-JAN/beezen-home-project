class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied!'
    redirect_to tasks_path
  end
end
