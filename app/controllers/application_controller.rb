class ApplicationController < ActionController::Base
  # ユーザー管理用のbefore_action
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のpath
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(admin)
      admin_path
    else
      root_path
    end
  end

  # ログアウト後のpath
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
      root_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:telephone_number])
  end

end
