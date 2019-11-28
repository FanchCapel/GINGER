class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if cookies[:experience].present?
      experience_data = JSON.parse cookies[:experience]
      cookies.delete :experience
      experience = Experience.new(experience_data)
      experience.user = current_user
      if experience.save
        experience_path(experience)
      end
    else
      new_experience_path
    end
  end
end
