class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])

    render json: @activity.to_json
  end

  def calculate_price
    sum = params[:activity_ids].inject(0) do |sum, activity_id|
      sum + Activity.find(activity_id).price_cents / 100
    end
    render json: { amount: sum }.to_json
  end
end
