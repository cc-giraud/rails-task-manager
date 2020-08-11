class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new(params[:id])
  end

  def create
    @task = Task.create(task_param)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  private

  def task_param
    params.require(:task).permit(:title, :details)
  end
end
