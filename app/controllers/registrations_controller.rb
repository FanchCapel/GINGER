class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    experience_path(resource.experiences.last)
  end
end
