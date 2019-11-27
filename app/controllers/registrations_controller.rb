class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if cookies[:experience].present?
      experience = JSON.parse cookies[:experience]
      id = Experience.create(experience)
      cookies.delete :experience
    end
  end
end
