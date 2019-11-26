class ExperienceSlicesController < ApplicationController
  def new

  end

  def create

  end

  private

  def experience_slice_params
    params.require(:experience_slice).permit(:activity, :experience, :order)
  end
end
