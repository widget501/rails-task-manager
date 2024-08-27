# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  # To refactor the following in [:show, :edit, :update, :destroy]
  # @task = Task.find(params[:id])
  # Use the following instead to refactor and remove from defs
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # and see in private - set task

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  # def create
  #   @task = Task.new(params[:task])
  #   @task.save    # Will raise ActiveModel::ForbiddenAttributesError
  # end

  def create
    @task = Task.new(task_params)
    @task.save
    # No need for app/views/tasks/create.html.erb
    redirect_to task_path(@task)
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)
    # No need for app/views/tasks/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
