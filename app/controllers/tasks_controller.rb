class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @task = Task.new(tag: "medical")
    @tasks_by_tag = current_user.tasks.order(created_at: :desc).group_by(&:tag)
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.tag = "autres" if @task.tag.blank?

    if @task.save
      redirect_to tasks_path
    else
      @tasks_by_tag = current_user.tasks.order(created_at: :desc).group_by(&:tag)
      render :index, status: :unprocessable_entity
    end
  end

  def update
    task = current_user.tasks.find(params[:id])
    if task.update(update_params)
      redirect_to tasks_path
    else
      redirect_to tasks_path
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :tag)
  end

  def update_params
    params.require(:task).permit(:done)
  end
end
