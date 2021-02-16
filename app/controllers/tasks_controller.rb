class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # // display the form
    @task = Task.new
  end

  def create
    # implement the info in the #new form
    @task = Task.new(strong_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    # find the task to edit
    @task = Task.find(params[:id])
  end

  def update
    # submit the task edit to db and save

    @task = Task.find(params[:id])
    @task.update(strong_params)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
  private

  def strong_params
    params["task"].permit(:title, :details, :completed)
  end
end
