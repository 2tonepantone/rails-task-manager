class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    if @task.save
      redirect_to tasks_path
    else
      render 'new.html.erb'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

end
