class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
    @diaries = current_user.diaries.order(created_at: :desc) # pour voir les entrées journal du plus récent au moins récent
  end

  def show
  end

  def new
    @diary = current_user.diaries.new
  end

  def create
    @diary = current_user.diaries.new(diary_params)
    if @diary.save
      redirect_to @diary  # on pourrait rajouter une virgule notice: "Journal créé ✅"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to @diary # on pourrait rajouter une virgule puis notice: "Journal modifié ✅"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @diary.destroy
    redirect_to diaries_path # on pourrait rajouter une virgule puis notice: "Journal supprimé 🗑️"
  end

private

  def set_diary
    @diary = current_user.diaries.find(params[:id])
  end

  def diary_params #strong params
    params.require(:diary).permit(:title, :content) # rajout de content grâce à ATO
  end

end
