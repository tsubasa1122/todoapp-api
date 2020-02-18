class Api::TasksController < Api::ApplicationController
  before_action :set_task, only: %i[show edit update]
  
  # before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show
  end

  def create
    task = Task.new(task_params)
    if task.save
      render 'success'
    else
      render 'error'
    end
  end

  def edit
  end

  def update
    if task.update(task_params)
      render 'success'
    else
      render 'error'
    end
  end

  def delete
    task = task.find(params[:id])
    task.destory
    render 'success'
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :expires_at, :completion_flg, tags_attributes:[:id, :name]).merge(user_id: @current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
