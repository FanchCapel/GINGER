class ExperiencesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update]

  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
    # authorize @experience
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render 'new'
    end

    # authorize @experience
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
