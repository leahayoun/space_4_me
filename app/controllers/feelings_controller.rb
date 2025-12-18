class FeelingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @feeling = current_user.feelings.find_or_initialize_by(date: @date)
  end

  def create
    @date = feeling_params[:date] || Date.today
    @feeling = current_user.feelings.find_or_initialize_by(date: @date)

    if @feeling.update(feeling_params)
      redirect_to root_path, notice: "Humeur enregistrée 🌱"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def feeling_params
    params.require(:feeling).permit(
      :date,
      :dysphoria,
      :custom_mood,
      :custom_symptom,
      mood_ids: [],
      symptom_ids: []
    )
  end
end
