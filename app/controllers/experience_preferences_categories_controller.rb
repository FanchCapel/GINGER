class ExperiencePreferencesCategoriesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_experience

  def new

  end

  def create

  end

  private

  def experience_slice_params
    params.require(:experience_slice).permit(:experience, :category)
  end

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end
end
