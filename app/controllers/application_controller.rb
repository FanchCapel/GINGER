class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :admin?

  def admin?
    signed_in? ? current_user.admin : false
  end

  def after_sign_in_path_for(resource)
    new_experience_path
  end
end
