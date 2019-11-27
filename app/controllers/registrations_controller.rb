class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if cookies[:experience].present?
      experience = JSON.parse cookies[:experience]
      cookies.delete :experience
      Experience.create(experience)
    end
  end
end
