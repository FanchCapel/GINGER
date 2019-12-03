class ExperienceSlicesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_experience

  def new
    redirect_to root_path, warning: "You are not authorized to access this page!" unless current_user.admin?
    @activities = Activity.all
    @experience_slice = ExperienceSlice.new
  end

  def create
    params[:experience_slice].values.each_with_index do |activity_id, index|
      experience_slice = ExperienceSlice.new(
        activity_id: activity_id,
        experience: @experience,
        order: index + 1
      )
      experience_slice.save
    end
    @experience.update(prepared_at: Time.now)
    experience.generate_messages
    redirect_to experiences_path
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def experience_slice_params
    params.require(:experience_slice).permit(:activity, :experience, :order)
  end

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end
end
