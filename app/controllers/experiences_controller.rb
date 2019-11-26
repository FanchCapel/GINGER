class ExperiencesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update]

  def index
    @experiences = Experience.all
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
