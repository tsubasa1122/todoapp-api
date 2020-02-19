class Api::TasksController < Api::ApplicationController
  before_action :set_task, only: %i[show edit update]
  
  # before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show
  end

  def create
    tag = Tag.find_or_create_by
    task = Task.new(task_params)
    task.tag_tasks.build(tag_id: tag.id)
    if task.save
      render 'api/success'
    else
      render 'api/error'
    end
  end

  def edit
  end

  def update
    if task.update(task_params)
      render 'api/success'
    else
      render 'api/error'
    end
  end

  def delete
    task = task.find(params[:id])
    task.destory
    render 'api/success'
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :expires_at, :completion_flg, tags_attributes:[:name]).merge(user_id: @current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
