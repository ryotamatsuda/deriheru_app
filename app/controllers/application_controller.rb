class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_operators_path
    when Operator
      operators_customers_path
    end
  end

  protected
  def not_access_of_login_user
    if admin_signed_in?
      redirect_back(fallback_location: admins_operators_path)
    elsif operator_signed_in?
      redirect_back(fallback_location: operators_customers_path)
    end
  end

end
