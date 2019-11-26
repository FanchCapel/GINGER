class ExperiencesController < ApplicationController
  def index

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  private

  def experience_params
    params.require(:experience_slice).permit(:user, :budget, :city, :date, :time_slot)
  end
end
