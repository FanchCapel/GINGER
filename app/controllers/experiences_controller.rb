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
    if current_user == nil
      redirect_to new_user_session_path(@experience)
    else
      @experience = Experience.new(experience_params)
      @experience.user = current_user
      if @experience.save
        redirect_to new_user_session_path(@experience)
      else
        render 'new'
      end
    end
    # authorize @experience
  end

  def edit

  end

  def update

  end

  private

  def experience_params
    params.require(:experience).permit(:user, :budget_cents, :city, :date, :time_slot)
  end
end
