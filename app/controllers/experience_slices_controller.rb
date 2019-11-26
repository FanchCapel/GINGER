class ExperienceSlicesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @activities = Activity.all
    @experience = Experience.find(params[:experience_id])
    @experience_slice = ExperienceSlice.new
  end

  def create
    @experience = Experience.find(params[:experience_id])

    experience_slice_1 = ExperienceSlice.new(
      activity_id: params[:experience_slice][:activity_1],
      experience: @experience,
      order: 1
    )
    experience_slice_1.save
    experience_slice_2 = ExperienceSlice.new(
      activity_id: params[:experience_slice][:activity_2],
      experience: @experience,
      order: 2
    )
    experience_slice_2.save
    experience_slice_3 = ExperienceSlice.new(
      activity_id: params[:experience_slice][:activity_3],
      experience: @experience,
      order: 3
    )
    experience_slice_3.save

    @experience.prepared_at = Time.now
    @experience.save

    redirect_to experiences_path
  end

  private

  def experience_slice_params
    params.require(:experience_slice).permit(:activity, :experience, :order)
  end
end
