class ApplicationController < ActionController::Base
  # ユーザー管理用のbefore_action
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:telephone_number])
  end


end
